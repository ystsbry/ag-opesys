resource "auth0_client" "spa" {
  name            = "${var.project_name}-spa"
  app_type        = "spa"
  oidc_conformant = true

  callbacks           = var.callback_urls
  allowed_logout_urls = var.logout_urls
  web_origins         = var.web_origins

  jwt_configuration {
    alg = "RS256"
  }
}

resource "auth0_resource_server" "api" {
  name       = "${var.project_name}-api"
  identifier = var.api_identifier

  enforce_policies                                = true
  token_dialect                                   = "access_token_authz"
  skip_consent_for_verifiable_first_party_clients = true
}
