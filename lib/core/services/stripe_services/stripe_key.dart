class StripeKey{
  final String _stripePublishableKey = "pk_test_51R7YCuFKXEtfT5CGd9p48VbqDaf5azpaHB4rada6f7AzL7eTXG00GNPsRcPOQDdyLTduywLmHc9cUSm3QkAwzXa400zTadXSnn";
  final String _stripeSecurityKey = "sk_test_51R7YCuFKXEtfT5CGLl9dKXXltRZd7ViTvlsZhFiP3EoZpRYyObXEC5RSP3Gdv0d3L6K9ZiTTuAU0pzkZIR6GSRqy00AiXHJqWX";

  String get stripeSecurityKey => _stripeSecurityKey;
  String get stripePublicKey => _stripePublishableKey;
}