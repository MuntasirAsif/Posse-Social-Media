import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/spacer/auto_spacer.dart';
import '../../../../../../core/services/stripe_services/stripe_services.dart';
import '../../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../../common_widget_style/common_widgets/common_widgets.dart';
import 'widget/premium_show_case_card.dart';
import 'widget/subscription_circle_images.dart';
import 'widget/subscription_header.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          SubscriptionHeader(textTheme: textTheme),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: AppPadding.screenHorizontalPadding,
                child: Column(
                  children: [
                    SubscriptionCircleImages(),
                    PremiumShowCaseCard(textTheme: textTheme),
                    AutoSpacer(space: 58.h),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: AppColor.white,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: CommonWidgets.primaryButton(
              context: context,
              title: 'Subscribe',
              color: AppColor.primaryColor,
              textColor: AppColor.white,
              onPressed: () async{
                await StripeServices.instance.makePayment(200,context).whenComplete((){
                  successfullyPlanSelectBottomSheet(context);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
  void successfullyPlanSelectBottomSheet(BuildContext context) {
    CommonWidgets.customConfirmationBottomSheet(
      context: context,
      iconPath: AppIcons.checkConfirmed,
      headerText: 'Success Select Plan',
      bodyText:
      'Unlock premium features, enjoy exclusive perks, and achieve your goals seamlessly.',
      confirmButtonText: "Continue",
      oneBottomButton: CommonWidgets.primaryButton(
        context: context,
        title: 'Continue',
        color: AppColor.primaryColor,
        textColor: AppColor.white,
        onPressed: () {
          context.push(RouteName.manageSubscriptionScreen);
        },
      ),
      onConfirm: () {},);
  }
}

