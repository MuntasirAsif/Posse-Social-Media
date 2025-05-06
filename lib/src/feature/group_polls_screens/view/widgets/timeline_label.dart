import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/common_widget_style/common_style/group_polls_style/group_polls_color_palette.dart';

// Widget timelineLabel({required BuildContext context, required String label}) {
//   return SizedBox(
//     height: 40.h,
//     child: Center(
//       child: Padding(
//         padding:  EdgeInsets.symmetric(horizontal: 16.w),
//         child: Row(
//           children: [
//             Expanded(
//               child: Divider(
//                 color: GroupPollsColorPalette.fog200,
//                 thickness: 1,
//                 height: 1,
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 8.w),
//               padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
//               decoration: BoxDecoration(
//                 color: GroupPollsColorPalette.fog200,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Text(
//                 label,
//                 style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                   color: Color(0xFF2E2A45),
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Divider(
//                 color: GroupPollsColorPalette.fog200,
//                 thickness: 1,
//                 height: 1,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }


Widget timelineLabel ({required BuildContext context, required String label}){
  return SizedBox(
    height: 40,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: const Divider(
            color: GroupPollsColorPalette.fog200,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
        ),
        Container(
          padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 6.h),
          decoration: BoxDecoration(
            color: GroupPollsColorPalette.fog200,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF2E2A45),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  );
}
