import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/utils/utils.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/spacer/auto_spacer.dart';
import '../../../../../../core/constant/padding.dart';
import '../../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../../common_widget_style/common_style/account_style/account_color.dart';
import '../../../../../common_widget_style/common_widgets/common_header.dart';
import '../../../../../common_widget_style/common_widgets/common_widgets.dart';
import 'widget/manage_account_membership_card.dart';
import 'widget/payment_information_card.dart';
import 'widget/subscription_cancel_card.dart';

class ManageSubscription extends StatelessWidget {
  const ManageSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonHeader(
            backgroundColor: AccountColor.backgroundColor,
            backgroundContainerHeight: 112.h,
            child: CommonWidgets.customAppBar(
              context: context,
              title: 'Manage Subscription',
              titleColor: AppColor.white,
              isBackButton: true,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: AppPadding.screenHorizontalPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSpacer(space: 16.h),
                    ManageAccountMemberShipCard(textTheme: textTheme),
                    AutoSpacer(space: 16.h),
                    Text(
                      'Payment Information',
                      style: textTheme.bodyLarge!.copyWith(
                        color: AccountColor.textSubColor,
                      ),
                    ),
                    AutoSpacer(space: 12.h),
                    PaymentInformationCard(
                      textTheme: textTheme,
                      cardNumber: '378282246314305',
                      nextBillingDate: Utils.formatDate(
                        dateTime: DateTime.now(),
                        formatType: 'dd MMM yyyy',
                      ),
                    ),
                    AutoSpacer(space: 24.h),
                    SubscriptionCancelCard(textTheme: textTheme),
                    AutoSpacer(space: 50.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
