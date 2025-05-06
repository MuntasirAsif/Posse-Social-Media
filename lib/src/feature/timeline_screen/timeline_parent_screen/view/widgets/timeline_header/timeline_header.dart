import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/src/common_widget_style/common_style/timeline_style/timeline_color.dart';
import '../../../../../../../core/constant/icons.dart';
import '../../../../../../common_widget_style/common_widgets/common_header.dart';
import '../../../../../../common_widget_style/common_widgets/common_widgets.dart';
import 'circle_profile.dart';

class TimelineScreenHeader extends StatelessWidget{
  const TimelineScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonHeader(
      backgroundContainerHeight: 225.h,
      backgroundColor: TimelineColor.primaryColor,
      child:
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 26.h,
          children: [

            CommonWidgets.customAppBar(
              context: context,
              title: "Angie's Possy",
              titleColor: TimelineColor.onPrimaryColor,
              subtitle: "Your Possy moments",
              subtitleColor:  TimelineColor.onPrimaryColor,
              actionWidgets:  Padding(
                padding: EdgeInsets.all(5.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5.w,
                  children: [
                    CommonWidgets.circleButton(
                      color: TimelineColor.iconColor,
                        imgPath: AppIcons.calendar,
                        onTap: (){},
                        padding: EdgeInsets.all(10.r)
                    ),
                    CommonWidgets.circleButton(
                        color: TimelineColor.iconColor,
                        imgPath: AppIcons.notificationIcon,
                        onTap: (){},
                        padding: EdgeInsets.all(10.r)

                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: 10,
                padding: AppPadding.screenHorizontalPadding,
                scrollDirection: Axis.horizontal,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (_, index){
                  return CircleProfile(
                    imagePath: AppImages.male2,
                    index: index,
                    name: index == 0 ? "Add Possy" : "Randy",
                  );
                  }
              ),
            ),
            // SizedBox(height: 1.h,)
          ],
        ),
      ),
    );
  }
}