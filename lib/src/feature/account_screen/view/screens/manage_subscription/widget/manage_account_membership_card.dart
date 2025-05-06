import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/constant/icons.dart';
import '../../../../../../../core/constant/padding.dart';
import '../../../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../../../common_widget_style/common_style/account_style/account_color.dart';
import '../../../../../../common_widget_style/common_widgets/spacer/auto_spacer.dart';
import 'manage_subscription_plan_featre.dart';
class ManageAccountMemberShipCard extends StatelessWidget {
  const ManageAccountMemberShipCard({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Membership',
          style: textTheme.bodyLarge!.copyWith(
            color: AccountColor.textSubColor,
          ),
        ),
        AutoSpacer(space: 12.h),
        Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Monthly Plan",
                        style: textTheme.headlineMedium,
                      ),
                      Text(
                        "Full access, cancel anytime.",
                        style: textTheme.bodyLarge!.copyWith(
                          color: AccountColor.textSubColor,
                        ),
                      ),
                    ],
                  ),
                  Text('\$8.99'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ManageSubscriptionPlanFeature(
                    leadingImage:
                    AppIcons.calenderIconManageSubscription,
                    title: 'Affordable Monthly Access',
                    subtitle:
                    'Enjoy premium features without long-term commitments or extra costs.',
                  ),
                  ManageSubscriptionPlanFeature(
                    leadingImage:
                    AppIcons.tagCrossIconManageSubscription,
                    title: 'Cancel Anytime Flexibility',
                    subtitle:
                    'Pause or cancel your subscription anytime without any hassle guaranteed.',
                  ),
                  ManageSubscriptionPlanFeature(
                    leadingImage:
                    AppIcons.benefitIconManageSubscription,
                    title: 'Unlimited App Usage Benefits',
                    subtitle:
                    'Explore all features and premium content throughout the month seamlessly.',
                  ),
                  ManageSubscriptionPlanFeature(
                    leadingImage: AppIcons.crownIconManageSubscription,
                    title: 'Exclusive Member Perks Access',
                    subtitle:
                    'Unlock special offers and member-only benefits available every month.',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}