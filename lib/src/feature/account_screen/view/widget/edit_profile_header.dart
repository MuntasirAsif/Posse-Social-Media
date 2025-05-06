import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constant/icons.dart';
import '../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../common_widget_style/common_style/account_style/account_color.dart';
import '../../../../common_widget_style/common_widgets/common_header.dart';
import '../../../../common_widget_style/common_widgets/common_widgets.dart';


class EditProfileHeader extends StatelessWidget {
  const EditProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonHeader(
      backgroundColor: AccountColor.backgroundColor,
      backgroundContainerHeight: 240.h,
      child: Column(
        children: [
          CommonWidgets.customAppBar(
            context: context,
            title: 'Profile Information',
            titleColor: AppColor.white,
            //leadingImagePath: AppIcons.backArrow,
            //leadingImageSize: Size(32.w, 32.w),
            isBackButton: true,
            leadingButtonOnTap: () => Navigator.pop(context),
          ),
          SizedBox(height: 5.h),
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  padding: EdgeInsets.all(4.r), // white border
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.white.withOpacity(0.75),
                  ),
                  child: CircleAvatar(
                    radius: 45.r,
                    backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=600',
                    ), // Replace with actual image path
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: Container(
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.edit,
                      size: 16.sp,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
