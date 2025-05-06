import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showReactionMenu(BuildContext context, Offset position) {
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;

  showMenu<String>(
    context: context,
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r),),
    position: RelativeRect.fromRect(
      position & const Size(40, 40),
      Offset.zero & overlay.size,
    ),
    items: [
      PopupMenuItem<String>(
        enabled: false,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/images/parent_screen/e1.png",
              height: 24,
              width: 24,
            ),
            SizedBox(width: 12.w,),
            Image.asset(
              "assets/images/parent_screen/e2.png",
              height: 24,
              width: 24,
            ),
             SizedBox(width: 12.w,),
            Image.asset(
              "assets/images/parent_screen/e3.png",
              height: 24,
              width: 24,
            ),
             SizedBox(width: 12.w,),
            Image.asset(
              "assets/images/parent_screen/e4.png",
              height: 24,
              width: 24,
            ),
             SizedBox(width: 12.w,),
            Image.asset(
              "assets/images/parent_screen/e5.png",
              height: 24,
              width: 24,
            ),
          ],
        ),
      ),
      const PopupMenuDivider(),
      PopupMenuItem<String>(
        value: "copy",
        child: Row(
          children: [
            Image.asset(
              "assets/images/parent_screen/copy.png",
              height: 18,
              width: 18,
            ),
            const SizedBox(width: 8),
            const Text("Copy"),
          ],
        ),
      ),
      const PopupMenuDivider(),
      PopupMenuItem<String>(
        value: "bookmark",
        child: Row(
          children: [
            Image.asset(
              "assets/images/parent_screen/bookmark.png",
              height: 18,
              width: 18,
            ),
            const SizedBox(width: 8),
            const Text("Add bookmark"),
          ],
        ),
      ),
    ],
  ).then((String? value) {
    if (value == "copy") {
      debugPrint("\nCopy tapped\n");
    } else if (value == "bookmark") {
      debugPrint("\nBookmark tapped\n");
    }
  });
}
