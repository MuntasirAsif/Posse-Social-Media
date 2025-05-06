import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonHeader extends StatelessWidget {
  const CommonHeader({
    super.key,
    required this.backgroundColor,
    this.child,
    this.bgImage,
    this.backgroundContainerHeight,
  });

  final Color backgroundColor;
  final Widget? child;
  final String? bgImage;
  final double? backgroundContainerHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5.h),
      height: backgroundContainerHeight ?? 210.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
        //  spacing: 20.h,
          children: [
            // Optional child widget placed on top
            if (child != null) child!,
            if(bgImage != null) Expanded(
              child: Image.asset(
                bgImage!,
                fit: BoxFit.cover,
               // width: ScreenUtil().screenWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

