import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/common_widget_style/common_style/group_polls_style/group_polls_color_palette.dart';
import 'package:possy_app/src/feature/group_polls_screens/view/widgets/history_content.dart';


Widget historySection({required BuildContext context}){

  final titleMedium = Theme.of(context).textTheme.titleMedium;

  return Container(
    padding: EdgeInsets.all(16.r),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.r),
        topRight: Radius.circular(24.r),
      ),
    ),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: GroupPollsColorPalette.borderColor,
        ),
      ),
      child: Column(
        children: [
          Text(
            "Previous history",
            style: titleMedium?.copyWith(
              color: GroupPollsColorPalette.pink300,
              fontWeight: FontWeight.w700,
            ),
          ),
          // Using List.generate with spread operator
          ...List.generate(
            5,
                (index) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: historyContent(context: context),
            ),
          ),

        ],
      ),
    ),
  );
}