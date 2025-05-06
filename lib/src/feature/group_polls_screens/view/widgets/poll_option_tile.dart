import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/theme/src/theme_extension/color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_style/group_polls_style/group_polls_color_palette.dart';
import 'package:possy_app/src/feature/group_polls_screens/view_model/polls_creation_bottom_sheet_provider.dart';
import 'package:possy_app/src/feature/vibe_check_screen/widgets/avatar_stack.dart';


Widget pollOptionTile(
    {
      required BuildContext context,
      required String text,
      required double percentage, // Between 0.0 to 1.0
      required List<Color>foregroundColor,
      bool? isInHistory,
      VoidCallback? onTap,
      required int index,
    }){

  // final Color foreground = foregroundColor[index];

  List<String> imageUrls =  [
    'https://randomuser.me/api/portraits/men/1.jpg',
    'https://randomuser.me/api/portraits/men/2.jpg',
    'https://randomuser.me/api/portraits/men/8.jpg',
    'https://randomuser.me/api/portraits/men/9.jpg',
    'https://randomuser.me/api/portraits/men/10.jpg',
  ];

  final bodyLarge = Theme.of(context).textTheme.bodyLarge;
  return Column(
    children: [
      Padding(
        padding:  EdgeInsets.only(bottom: 12.h,),
        child: Consumer(
          builder: (context, ref, child) {
            final countPolls = ref.read(pollsCreationBottomSheetProvider.notifier);

            return GestureDetector(
              onTap: (){
                countPolls.incrementPollCounter(index);
                debugPrint("\n\n onTap Poll option: Voting completed\n\n");
              },
              child: Container(
                height: 54.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isInHistory == true
                      ? Colors.transparent
                      : GroupPollsColorPalette.optionTileBackground,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Stack(
                  children: [FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: percentage, // Between 0.0 and 1.0
                    child: Container(
                      padding: EdgeInsets.only(left: 16.w),
                      decoration: BoxDecoration(
                        color: percentage == 0
                            ? GroupPollsColorPalette.optionTileBackground
                            : isInHistory == true
                            ? foregroundColor[index].withOpacity(0.6)
                            : foregroundColor[index],
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                  ),
                    Positioned(
                      top: 15.h,
                     left: 16.w,
                      child: Text(
                        text,
                        style:  bodyLarge?.copyWith(
                            color: isInHistory == true ? AppColor.primaryTextColor.withOpacity(0.4) : AppColor.primaryTextColor,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    )
                ]
                ),
              ),
            );
          }
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding:  EdgeInsets.only(bottom: 12.h),
          child: percentage == 0 ? SizedBox() : AvatarStack(imageUrls:imageUrls,maxDisplay: 4,) ,
        ),
      ) ,
      SizedBox(height: 16.h,)

    ],
  );
}