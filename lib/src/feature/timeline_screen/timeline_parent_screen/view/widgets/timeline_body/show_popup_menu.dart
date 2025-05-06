import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/src/common_widget_style/common_style/timeline_style/timeline_color.dart';
import 'package:possy_app/src/feature/timeline_screen/page_id.dart';

Future<String> showPopupMenu({required BuildContext context, required GlobalKey menuKey, required String pageId}) async {
  final RenderBox renderBox = menuKey.currentContext!.findRenderObject() as RenderBox;
  final Offset offset = renderBox.localToGlobal(Offset.zero); // top-left position
  final Size size = renderBox.size;

  String result = "";

  await showMenu<String>(
    context: context,
    color: Colors.white,
    elevation: 10,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
    position: RelativeRect.fromLTRB(
      offset.dx,
      offset.dy + size.height,
      offset.dx + size.width,
      offset.dy,
    ),
    items: [
      if(pageId == TimelinePageId.timeline)
      PopupMenuItem<String>(
        value: "view",
        child: popupMenu(context: context,iconPath: AppIcons.personFill,text: "View Profile")
      ),
      if(pageId == TimelinePageId.timeline)
     const PopupMenuDivider(),

      PopupMenuItem<String>(
          value: "report",
          child: popupMenu(context: context,iconPath: AppIcons.report,text: "Report")
      ),

      const PopupMenuDivider(),

      PopupMenuItem<String>(
          value: "snooze",
          child: popupMenu(context: context,iconPath: AppIcons.snooze,text: "Snooze")
      ),
    ],
  ).then((value) async {
    result = value ?? "";
  });

  return result;
}

Widget popupMenu({required BuildContext context,  required String iconPath, required String text}){
  return Padding(
    padding: EdgeInsets.all(16.r),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 10.w,
      children: [
        Image.asset(iconPath,width: 18.w,height: 18.w,fit: BoxFit.cover,color: TimelineColor.iconColor,),
        Text(text,style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: TimelineColor.textColor
        ),)
      ],
    ),
  );
}

