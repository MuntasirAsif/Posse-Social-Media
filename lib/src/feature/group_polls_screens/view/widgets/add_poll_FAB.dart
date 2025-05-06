import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/theme/src/theme_extension/color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_style/group_polls_style/group_polls_color_palette.dart';
import 'package:possy_app/src/common_widget_style/common_style/timeline_style/timeline_color.dart';
import 'package:possy_app/src/feature/group_polls_screens/view/widgets/poll_creation_bottom_sheet.dart';

class AddPollFAB extends StatelessWidget {
  final VoidCallback onPressed;

  const AddPollFAB({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {

    final bodyLarge = Theme.of(context).textTheme.bodyLarge;

    return FloatingActionButton.extended(
      elevation: 4,
      onPressed: (){
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => const PollCreationBottomSheet(),
        );
        debugPrint("\n\nonTap FAB: Poll creation bottom sheet is opened\n");
      },
      backgroundColor: GroupPollsColorPalette.headerBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(99.r),
      ),
      icon:  Icon(Icons.add, color:AppColor.primaryTextColor,size: 24.r,),
      label:  Text(
        'Add Poll',
        style: bodyLarge?.copyWith(
          color: AppColor.primaryTextColor,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}
