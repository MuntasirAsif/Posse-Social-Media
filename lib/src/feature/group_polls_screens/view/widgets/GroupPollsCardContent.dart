import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/core/theme/src/theme_extension/color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_style/group_polls_style/group_polls_color_palette.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/feature/group_polls_screens/view/widgets/poll_option_tile.dart';
import 'package:possy_app/src/feature/group_polls_screens/view/widgets/show_custom_pop_up_menu.dart';
import 'package:possy_app/src/feature/group_polls_screens/view_model/polls_creation_bottom_sheet_provider.dart';

import '../../../vibe_check_screen/widgets/avatar_stack.dart';
Widget groupPollsCardContent({
  required BuildContext context,
  bool? isInHistory,
}) {
  final headlineSmall = Theme.of(context).textTheme.headlineSmall;
  final bodySmall = Theme.of(context).textTheme.bodySmall;
  final GlobalKey _menuKey = GlobalKey();

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 24.h,),
      /// Profile Section
      CommonWidgets.customAppBar(
        context: context,
        leadingImagePath: "assets/images/avatar_without_bg.png",
        title: "Angie's Possy",
        titleColor: AppColor.primaryTextColor,
        subtitle: "Created by Admin",
        subtitleColor: GroupPollsColorPalette.subTitleColor,
        leadingBgColor: AuthColorPalette.greyscale200,
        actionWidgets: IconButton(
          key: _menuKey,
          icon: Icon(Icons.more_vert_rounded),
          onPressed: () async {
            showCustomPopupMenu(context: context, key: _menuKey);
          },
        ),
      ),
      Divider(color: AuthColorPalette.greyscale200),
      const SizedBox(height: 24),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Consumer(
          builder: (context,ref, child) {
            final _question = ref.watch(pollsCreationBottomSheetProvider).pollQuestion;
            final _options = ref.watch(pollsCreationBottomSheetProvider).options;
            final pollPercentage = ref.watch(pollsCreationBottomSheetProvider);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Question
                Text(
                 _question == "" ? "What's your poll about?" : _question,
                  textAlign: TextAlign.left,
                  style: headlineSmall?.copyWith(
                    color: AppColor.primaryTextColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: 10.h),

                /// Time remaining
                isInHistory == true ? SizedBox() : Row(
                  children: [
                    Icon(
                      Icons.access_time_filled,
                      color: GroupPollsColorPalette.green600,),
                    SizedBox(width: 6),
                    Text(
                      "Ends in 2 hrs",
                      style: bodySmall?.copyWith(
                        color: GroupPollsColorPalette.green600,),),
                  ],
                ),
                SizedBox(height: 24.h),
                /// Poll Options
                ...List.generate(_options.length, (index) {
                  double percentage = 0.0;
                  int total = pollPercentage.totalPollCounter;

                  if (total > 0) {
                    if (index == 0) {
                      percentage = pollPercentage.pollCounter1 / total;
                    } else if (index == 1) {
                      percentage = pollPercentage.pollCounter2 / total;
                    } else if (index == 2) {
                      percentage = pollPercentage.pollCounter3 / total;
                    } else if (index == 3) {
                      percentage = pollPercentage.pollCounter4 / total;
                    }
                  }

                  // Clamp the percentage to a valid range [0.0, 1.0]
                  percentage = percentage.clamp(0.0, 1.0);

                  return Column(
                    children: [
                      pollOptionTile(
                        context: context,
                        text: _options[index],
                        percentage: percentage,
                        foregroundColor: GroupPollsColorPalette.optionTilecolor,
                        isInHistory: isInHistory,
                        index: index,
                      ),
                    ],
                  );
                }),

              ],
            );
          }
        ),
      ),
    ],
  );
}
