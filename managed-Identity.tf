resource "azurecaf_name" "managed-identity" {
  count = var.github_repo == null ? 0 : 1

  resource_types = [
    "azurerm_resource_group",
    "azurerm_user_assigned_identity"
  ]
  name     = "github-${var.project-name}"
  prefixes = var.resource-prefixes
  suffixes = var.resource-suffixes
}

resource "azurerm_resource_group" "github" {
  count    = var.github_repo == null ? 0 : 1
  provider = azurerm.mi

  name     = azurecaf_name.managed-identity[0].results.azurerm_resource_group
  location = var.location
}

resource "azurerm_user_assigned_identity" "github" {
  count    = var.github_repo == null ? 0 : 1
  provider = azurerm.mi

  location            = var.location
  name                = azurecaf_name.managed-identity[0].results.azurerm_user_assigned_identity
  resource_group_name = azurerm_resource_group.github[0].name
}

resource "azurerm_federated_identity_credential" "github" {
  count    = var.github_repo == null ? 0 : 1
  provider = azurerm.mi

  name                = azurecaf_name.managed-identity[0].results.azurerm_user_assigned_identity
  resource_group_name = azurerm_resource_group.github[0].name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = "https://token.actions.githubusercontent.com"
  parent_id           = azurerm_user_assigned_identity.github[0].id
  subject             = "repo:${var.github_repo.owner}/${var.github_repo.name}:environment:${var.github_repo.environment}"
}

# grant owner access to default azurerm provider subscription
# use data resource to get current sub
data "azurerm_subscription" "current" {}

resource "azurerm_role_assignment" "github" {
  count    = var.github_repo == null ? 0 : 1

  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Owner"
  principal_id         = azurerm_user_assigned_identity.github[0].principal_id
}