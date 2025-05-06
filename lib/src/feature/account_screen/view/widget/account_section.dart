
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../common_widget_style/common_widgets/spacer/auto_spacer.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({
    super.key,
    required this.textTheme,
    required this.widgetList,
     this.title,
  });

  final TextTheme textTheme;
  final String? title;
  final List<Widget> widgetList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.symmetric(vertical:8.h,horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(title!=null)
          Text(
            title!,
            style: textTheme.bodyMedium!.copyWith(color: AppColor.bodyTextColor),
          ),
          AutoSpacer(space: 8),
          ...widgetList,
        ],
      ),
    );
  }
}