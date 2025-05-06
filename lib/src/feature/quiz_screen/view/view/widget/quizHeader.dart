import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/core/theme/src/theme_extension/color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_header.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';

 class QuizeHeader extends StatelessWidget {
  const QuizeHeader({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return CommonHeader(
      backgroundColor: Color(0xff7ADFCE),
      bgImage: "assets/images/quizscreen/qz.png",
      backgroundContainerHeight: 175.h,
      child: CommonWidgets.customAppBar(
        margin: EdgeInsets.all(0),
        leadingImageSize: Size(50.w, 50.w),
        // leadingBgColor: Color(0xffEBE5FF),
        context: context,
        title: 'Angie’s Possy',
        titleColor: Colors.black,
        subtitle: 'Good vibes only',
        subtitleColor: Colors.black,
        leadingImagePath: AppImages.screenTopAvatar,
        actionWidgets: Container(
          margin: EdgeInsets.only(right: 16),
          child: Stack(
            children: [
              Container(
                  height: 40.w,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Image.asset(AppIcons.notificationIcon)),
              Positioned(
                right: 8.w,
                top: 8.w,
                child: CircleAvatar(
                  radius: 6.r,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.circle,size: 10,color:AppColor.notifyRed,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
