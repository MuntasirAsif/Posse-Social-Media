import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/theme/src/theme_extension/color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_style/group_polls_style/group_polls_color_palette.dart';

Future<void> showCustomPopupMenu({required BuildContext context,required GlobalKey key}) async {
  final RenderBox button = key.currentContext!.findRenderObject() as RenderBox;
  final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
  final Offset position = button.localToGlobal(Offset.zero, ancestor: overlay);

  final bodyLarge = Theme.of(context).textTheme.bodyLarge;

  final RelativeRect rect = RelativeRect.fromLTRB(
    position.dx ,
    position.dy + 10.h,
    overlay.size.width - position.dx - 10.h,
    0,
  );

  await showMenu<String>(
    context: context,
    position: rect,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.r),
    ),
    color: Colors.white,
    elevation: 4,
    items: [
      PopupMenuItem<String>(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        value: 'edit',
        child: SizedBox(
          width: 125.w,
          child: Row(
            children:  [
              Icon(Icons.edit, color: GroupPollsColorPalette.grayBlack500),
              SizedBox(width: 10.w),
              Text("Edit", style: bodyLarge?.copyWith(
                color: AppColor.primaryTextColor,
                fontWeight: FontWeight.w500
              )),
            ],
          ),
        ),
      ),
      const PopupMenuDivider(height: 1,),
      PopupMenuItem<String>(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        value: 'delete',
        child: SizedBox(
          width: 125.w,
          child: Row(
            children:  [
              Icon(Icons.delete,  color: Colors.red),
              SizedBox(width: 10.w),
              Text("Delete", style: bodyLarge?.copyWith(
                  color: Colors.red,
                  fontWeight: FontWeight.w500
              )),
              Spacer()
            ],
          ),
        ),
      ),
    ],
  );
}
