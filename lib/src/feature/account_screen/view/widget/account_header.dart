import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/common_widget_style/common_style/account_style/account_color.dart';

import '../../../../../core/constant/padding.dart';
import '../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../common_widget_style/common_widgets/common_header.dart';
import '../../../../common_widget_style/common_widgets/common_widgets.dart';
import '../../../../common_widget_style/common_widgets/spacer/auto_spacer.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return CommonHeader(
      backgroundColor: AccountColor.backgroundColor,
      child: Column(
        children: [
          CommonWidgets.customAppBar(
            context: context,
            title: 'Account',
            titleColor: Colors.white,
            isBackButton: true,
          ),
          AutoSpacer(space: 16.h),
          Padding(
            padding: AppPadding.screenHorizontalPadding,
            child: Row(
              spacing: 12.w,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 56.w,
                  width: 56.w,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://randomuser.me/api/portraits/men/9.jpg',
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Brooklyn Simmons",
                      style: textTheme.titleMedium!.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                    Text("Angie’s possy",style: textTheme.bodyLarge!.copyWith(
                      color: AppColor.white,
                    ),),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*
CommonHeader(
backgroundColor: Color(0xFFA888FD),
child: Column(
mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.start,
mainAxisSize: MainAxisSize.min,
children: [
CommonWidgets.customAppBar(
context: context,
title: 'Account',
titleColor: AppColor.white,
leadingImagePath: AppIcons.backArrow,
leadingImageSize: Size(32.w, 32.w),
leadingButtonOnTap: ()=>Navigator.pop(context)
),
AutoSpacer(space: 24.h),
Padding(
padding: AppPadding.screenHorizontalPadding,
child: Row(
spacing: 12.w,
mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Container(
height: 56.w,
width: 56.w,
decoration: BoxDecoration(
color: AppColor.white,
borderRadius: BorderRadius.circular(100),
image: DecorationImage(
image: NetworkImage(
'https://randomuser.me/api/portraits/men/9.jpg',
),
),
),
),
Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
"Brooklyn Simmons",
style: textTheme.titleMedium!.copyWith(
color: AppColor.white,
),
),
Text("Angie’s possy",style: textTheme.bodyLarge!.copyWith(
color: AppColor.white,
),),

],
),
],
),
),
],
),
)*/
