import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../core/constant/icons.dart';
import '../../../../../../../core/theme/src/theme_extension/color_pallete.dart';

class FaqQuestion extends StatelessWidget {
  const FaqQuestion({
    super.key,
    required this.isExpanded,
    required this.question,
    required this.answer,
    required this.onTap,
  });

  final bool isExpanded;
  final String question;
  final String answer;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedSize(
        duration: Duration(milliseconds: 300), // Duration for the expansion
        curve: Curves.fastOutSlowIn, // Smooth curve for the animation
        child: Container(
          padding: EdgeInsets.all(24.r),
          margin: EdgeInsets.symmetric(vertical: 4.h),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      question,
                      style: textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: isExpanded ? 2 : 0,
                    child: SvgPicture.asset(AppIcons.downArrowIcon),
                  ),
                ],
              ),
              if (isExpanded)
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Divider(),
                    ),
                    Text(
                      answer,
                      style: textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 100,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
