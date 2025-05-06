import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubscriptionNotifier extends StateNotifier<int> {
  SubscriptionNotifier() : super(0);

  void selectedSubscription(int subscriptionId) {
    state = subscriptionId;
  }
}

final subscriptionNotifierProvider =
    StateNotifierProvider<SubscriptionNotifier, int>((ref) {
      return SubscriptionNotifier();
    });
