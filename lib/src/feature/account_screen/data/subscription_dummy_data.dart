import '../model/subscription_model.dart';

List<SubscriptionModel> getDummySubscriptions() {
  return [
    SubscriptionModel(
      subscriptionId: 1,
      subscriptionName: "Basic Plan",
      subscriptionPrice: 9.99,
      pricePerMonth: 1.99,
      subscriptionDuration: "1 month",
      isPopular: null,
    ),
    SubscriptionModel(
      subscriptionId: 2,
      subscriptionName: "Pro Plan",
      subscriptionPrice: 29.99,
      pricePerMonth: 2.99,
      subscriptionDuration: "6 months",
      isPopular: true,
    ),
    SubscriptionModel(
      subscriptionId: 3,
      subscriptionName: "Ultimate Plan",
      subscriptionPrice: 99.99,
      pricePerMonth: 9.99,
      subscriptionDuration: "1 year",
      isPopular: null,
    ),
    SubscriptionModel(
      subscriptionId: 4,
      subscriptionName: "Free Trial",
      subscriptionPrice: 0.00,
      pricePerMonth: null,
      subscriptionDuration: "7 days",
      isPopular: null,
    ),
  ];
}
