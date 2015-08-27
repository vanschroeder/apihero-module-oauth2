tokenDef = require '../../common/models/oauth-token.json'
authorizationCodeDef = require '../../common/models/oauth-authorization-code.json'
clientApplicationDef = require '../../common/models/oauth-client-application.json'
permissionDef = require '../../common/models/oauth-permission.json'
scopeDef = require '../../common/models/oauth-scope.json'
scopeMappingDef = require '../../common/models/oauth-scope-mapping.json'
# Remove proerties that will confuse LB

getSettings = (def) ->
  settings = {}
  for s of def
    if s == 'name' or s == 'properties'
      continue
    else
      settings[s] = def[s]
  settings

module.exports = (dataSource) ->
  # "OAuth token"
  OAuthToken = dataSource.createModel(tokenDef.name, tokenDef.properties, getSettings(tokenDef))
  # "OAuth authorization code"
  OAuthAuthorizationCode = dataSource.createModel(authorizationCodeDef.name, authorizationCodeDef.properties, getSettings(authorizationCodeDef))
  # "OAuth client registration record"
  OAuthClientApplication = dataSource.createModel(clientApplicationDef.name, clientApplicationDef.properties, getSettings(clientApplicationDef))
  # "OAuth permission"
  OAuthPermission = dataSource.createModel(permissionDef.name, permissionDef.properties, getSettings(permissionDef))
  # "OAuth scope"
  OAuthScope = dataSource.createModel(scopeDef.name, scopeDef.properties, scopeDef)
  # "OAuth scope mapping"
  OAuthScopeMapping = dataSource.createModel(scopeMappingDef.name, scopeMappingDef.properties, getSettings(scopeMappingDef))
  {
    OAuthToken: OAuthToken
    OAuthAuthorizationCode: OAuthAuthorizationCode
    OAuthClientApplication: OAuthClientApplication
    OAuthPermission: OAuthPermission
    OAuthScope: OAuthScope
    OAuthScopeMapping: OAuthScopeMapping
  }

# ---
# generated by js2coffee 2.1.0