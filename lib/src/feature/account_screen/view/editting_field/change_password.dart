import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../common_widget_style/common_widgets/common_widgets.dart';
import '../../../../common_widget_style/common_widgets/spacer/auto_spacer.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Current Password'),
        AutoSpacer(space: 10.h),
        TextFormField(decoration: InputDecoration(hintText: 'Enter Name')),
        AutoSpacer(space: 15.h),
        Text('Enter new password'),
        AutoSpacer(space: 10.h),
        TextFormField(decoration: InputDecoration(hintText: 'Enter Name')),
        AutoSpacer(space: 15.h),
        Text('Re-enter new password'),
        AutoSpacer(space: 10.h),
        TextFormField(decoration: InputDecoration(hintText: 'Enter Name')),
        AutoSpacer(space: 15.h),
        Row(
          children: [
            Expanded(
              child: CommonWidgets.primaryButton(
                context: context,
                title: 'Cancel',
                color: AppColor.surfaceColor,
                textColor: Colors.black,
                onPressed: () {},
              ),
            ),
            AutoSpacer(space: 12.w),
            Expanded(
              child: CommonWidgets.primaryButton(
                context: context,
                title: 'Update',
                color: AppColor.primaryColor,
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
