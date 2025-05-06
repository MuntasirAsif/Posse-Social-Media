import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/src/feature/timeline_screen/page_id.dart';

import '../../../../../../../../core/constant/icons.dart';
import '../../../../../../../../core/routes/route_name.dart';
import '../../../../../../../common_widget_style/common_style/timeline_style/timeline_color.dart';
import '../../../../view_model/timeline_screen_provider.dart';
import '../report_bottom_sheet.dart';
import '../show_popup_menu.dart';

class CardHeader extends StatelessWidget{
  final String profilePicture;
  final String userName;
  final String postDate;
  final String pageId;
   CardHeader({
    super.key,
    required this.profilePicture,
    required this.userName,
    required this.postDate,
    required this.pageId,
  });

  final GlobalKey _menuKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return     Row(
      spacing: 10.w,
      children: [
        ///Profile Picture
        GestureDetector(
          onTap: () {
            if(pageId == TimelinePageId.timeline) {
              context.push(RouteName.userProfileScreen);
            }
            debugPrint("\nTaped on profile picture.\n");
          },
          child: ClipOval(
            child: Image.asset(
              profilePicture,
              width: 40.w,
              height: 40.w,
            ),
          ),
        ),

        /// User name and post date
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                if(pageId == TimelinePageId.timeline) {
                  context.push(RouteName.userProfileScreen);
                }
                debugPrint("\nTaped on User name.\n");
              },
              child: Text(
                userName,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: TimelineColor.textColor,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Text(
              postDate,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: TimelineColor.lightTextColor,
                fontWeight: FontWeight.w500
              ),
            ),
          ],
        ),

        Spacer(),

        /// post menu
        Consumer(
            builder: (_, ref, _) {

              final editState = ref.read(timelineProvider.notifier);
              return GestureDetector(
                key: _menuKey,
                onTap: () async {
                  debugPrint("\nTaped on post menu.\n");
                  final value = await showPopupMenu(
                      pageId: pageId,
                      context: context,
                      menuKey: _menuKey
                  );

                  debugPrint("\nselected value : $value\n");

                  if (value == "view") {
                    context.push(RouteName.userProfileScreen);
                  }
                  else if(value == "report"){
                    await editState.reportBottomSheet(
                        context:context,
                        bodyWidget:  Column(
                          children: [
                            Text("Report the user",style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: TimelineColor.textColor
                            ),),
                            SizedBox(height: 40.h,),
                            ReportBottomSheetBody(),

                          ],
                        )
                    );

                  }
                  else if(value == "snooze"){

                  }
                },
                child: Container(
                  width: 28.w,
                  height: 28.w,
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                    color: TimelineColor.secondaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xffECEFF3)),
                  ),
                  child: Image.asset(
                    AppIcons.threeDot,
                    color: TimelineColor.onSecondaryColor,
                  ),
                ),
              );
            }
        ),
      ],
    );
  }
}