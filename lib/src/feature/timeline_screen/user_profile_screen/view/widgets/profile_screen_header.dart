import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/src/common_widget_style/common_style/timeline_style/timeline_color.dart';
import '../../../../../../../core/constant/icons.dart';
import '../../../../../common_widget_style/common_widgets/common_header.dart';
import '../../../../../common_widget_style/common_widgets/common_widgets.dart';


class UserProfileScreenHeader extends StatelessWidget{

  final String userName;
  final String fullName;
  final String profilePicture;
  const UserProfileScreenHeader({super.key, required this.userName, required this.fullName, required this.profilePicture});

  @override
  Widget build(BuildContext context) {
    return CommonHeader(
      backgroundContainerHeight: 200.h,
      backgroundColor: TimelineColor.primaryColor,
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
       // spacing: 24.h,
        children: [

          /// Appbar
          CommonWidgets.customAppBar(
            isBackButton: true,
            context: context,
            title: "Profile",
            titleColor: TimelineColor.onPrimaryColor,
            actionWidgets:  Padding(
              padding: EdgeInsets.all(5.r),
              child: CommonWidgets.circleButton(
                  color: TimelineColor.iconColor,
                  imgPath: AppIcons.calendar,
                  onTap: (){},
                  padding: EdgeInsets.all(10.r)
              ),
            ),
          ),

          ///
          Padding(
            padding:  AppPadding.screenHorizontalPadding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 12.w,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: Color(0xff5D7937)
                    )
                  ),
                  child: ClipRRect(child: Image.asset(AppImages.male2,width: 55.w,height: 55.w,fit:BoxFit.cover,)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(fullName,style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),),
                    Text('@$userName',style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),),
                  ],
                )
              ],
            ),
          )

          // SizedBox(height: 1.h,)
        ],
      ),
    );
  }
}