import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../common_widget_style/common_widgets/common_widgets.dart';
import '../../../../common_widget_style/common_widgets/spacer/auto_spacer.dart';

class ChangeEmail extends StatelessWidget {
  const ChangeEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Change Email'),
        AutoSpacer(space: 10.h),
        TextFormField(decoration: InputDecoration(hintText: 'Enter new email')),
        AutoSpacer(space: 10.h),
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
