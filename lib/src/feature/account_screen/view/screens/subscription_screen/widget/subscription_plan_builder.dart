import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../model/subscription_model.dart';
import '../../../../data/subscription_dummy_data.dart';
import '../../../../view_model/subscription_riverpod.dart';
import 'premium_plan_card.dart';

class SubscriptionPlanBuilder extends ConsumerWidget {
  const SubscriptionPlanBuilder({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: getDummySubscriptions().length,
      itemBuilder: (BuildContext context, int index) {
        SubscriptionModel subscription = getDummySubscriptions()[index];
        final subscriptionNotifier = ref.read(
          subscriptionNotifierProvider.notifier,
        );
        bool isSelected =
            ref.watch(subscriptionNotifierProvider) ==
            subscription.subscriptionId;
        return PremiumPlanCard(
          textTheme: textTheme,
          isPopular: subscription.isPopular ?? false,
          isSelected: isSelected,
          onChanged: () {
            subscriptionNotifier.selectedSubscription(
              subscription.subscriptionId,
            );
          },
          title: subscription.subscriptionName,
          price: subscription.subscriptionPrice,
          pricePerMonth: subscription.pricePerMonth.toString(),
        );
      },
    );
  }
}
