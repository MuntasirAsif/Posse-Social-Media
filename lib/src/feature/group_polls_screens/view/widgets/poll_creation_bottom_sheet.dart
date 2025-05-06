import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_style/group_polls_style/group_polls_color_palette.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/feature/group_polls_screens/view/widgets/parts/polls_creation_bottom_sheet_input_content.dart';
import 'package:possy_app/src/feature/group_polls_screens/view_model/polls_creation_bottom_sheet_provider.dart';

class PollCreationBottomSheet extends StatelessWidget {
  const PollCreationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final titleMedium = Theme.of(context).textTheme.titleMedium;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, // Keyboard height
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40.w,
                  height: 5.h,
                  margin: EdgeInsets.only(bottom: 16.h),
                  decoration: BoxDecoration(
                    color: GroupPollsColorPalette.grayScale900,
                    borderRadius: BorderRadius.circular(99.r),
                  ),
                ),
              ),
              Row(
                children: [
                  ImageIcon(
                    AssetImage(AppIcons.horizontalPollBar),
                    color: GroupPollsColorPalette.secondaryOrange,
                  ),
                  SizedBox(width: 8.w),

                  Text(
                    "Poll Creation",
                    style: titleMedium?.copyWith(
                      color: GroupPollsColorPalette.grayScale900,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              PollsCreationBottomSheetInputContent(),
              Consumer(
                builder: (context, ref, child) {
                  final _options =
                      ref.watch(pollsCreationBottomSheetProvider).options;

                  return CommonWidgets.primaryButton(
                    context: context,
                    title: "Create Poll",
                    color:
                        2 <= _options.length && _options.length <= 4
                            ? AuthColorPalette.primary
                            : GroupPollsColorPalette.optionTileBackground,
                    textColor:
                        2 <= _options.length && _options.length <= 4 ? Colors.white : GroupPollsColorPalette.grayBlack500,
                    onPressed: () {
                      ref.read(pollsCreationBottomSheetProvider.notifier).onTapCreatePoll(context: context);
                    },
                  );
                },
              ),
              SizedBox(height: 44.h),
            ],
          ),
        ),
      ),
    );
  }
}
