class EndPoints {
    // Base URLs
  static const String baseURL = "https://api.kroger.com/v1";
  static const String tokenURL = "$baseURL/connect/oauth2/token"; // Token endpoint
  static const String authorizationURL = "$baseURL/connect/oauth2/authorize"; // Authorization endpoint

  // Products Endpoints
  static const String productsEndPoint = "$baseURL/products"; // Endpoint to fetch products

  // Client credentials
  static const String clientId = "horecasmart-243261243034246a52764d306467737744714e65704f35616e2f39502e715859624f696b49316a5475553442442f61575857323736636749505867715595287317563223772"; // Client ID
  static const String clientSecret = "gN30muUKVb3debh3-Ml1FIbKLWNQy9Crv6PJvxSZ"; // Client Secret
  static const String redirectUrl = "http://www.localhost:3000/callback"; // Redirect URL for the OAuth flow

  // Scopes
  static const String scopes = "product.compact"; // Define scope for product information
}