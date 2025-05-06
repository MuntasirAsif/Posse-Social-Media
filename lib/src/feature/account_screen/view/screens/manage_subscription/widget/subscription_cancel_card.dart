import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/common_widget_style/common_style/account_style/account_color.dart';

import '../../../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../../../common_widget_style/common_widgets/common_widgets.dart';

class SubscriptionCancelCard extends StatelessWidget {
  const SubscriptionCancelCard({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(vertical: 15.h),
          ),
          backgroundColor: WidgetStateProperty.all(Color(0xffFFF0F3)),
          side: WidgetStateProperty.all(BorderSide(color: AppColor.notifyRed)),
        ),
        onPressed: () {
          CommonWidgets.customConfirmationBottomSheet(
            context: context,
            bodyWidget: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12.h,
              children: [
                Text(
                  'Cancellation Survey: Help Us Improve',
                  style: textTheme.titleSmall,
                ),
                Text(
                  "We're sorry to see you go! Please let us know why you're canceling your monthly plan.",
                  style: textTheme.labelLarge,
                ),
                buildCancelingReason(
                  context: context,
                  isSelected: true,
                  title: "Don't have enough time",
                ),
                buildCancelingReason(
                  context: context,
                  isSelected: false,
                  title: "Content didn't meet expectations",
                ),
                buildCancelingReason(
                  context: context,
                  isSelected: false,
                  title: "Subscription is too expensive",
                ),
                buildCancelingReason(
                  context: context,
                  isSelected: false,
                  title: "No noticeable learning progress",
                ),
                buildCancelingReason(
                  context: context,
                  isSelected: false,
                  title: "Lessons aren't engaging enough",
                ),
                buildCancelingReason(
                  context: context,
                  isSelected: false,
                  title: "Achieved desired language proficiency",
                ),
                buildCancelingReason(
                  context: context,
                  isSelected: false,
                  title: "Other",
                ),
              ],
            ),
            confirmButtonText: 'Confirm',
            confirmationButtonColor: Color(0xffEB3D4D),
            onConfirm: () {},
          );
        },
        child: Text('Cancel Subscription', style: textTheme.bodyMedium),
      ),
    );
  }

  Container buildCancelingReason({
    required BuildContext context,
    required bool isSelected,
    required String title,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF9F9F9),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: ListTile(
        leading: Icon(
          isSelected ? Icons.check_circle : Icons.circle_outlined,
          color: isSelected ? Color(0xff049741) : AccountColor.textSubColor,
        ),
        title: Text(title),
      ),
    );
  }
}
