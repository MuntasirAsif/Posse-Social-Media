import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:possy_app/core/constant/icons.dart';

import '../../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../../common_widget_style/common_style/account_style/account_color.dart';
import '../../../../../common_widget_style/common_widgets/common_header.dart';
import '../../../../../common_widget_style/common_widgets/common_widgets.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            CommonHeader(
              backgroundColor: AccountColor.backgroundColor,
              backgroundContainerHeight: 112.h,
              child: CommonWidgets.customAppBar(
                context: context,
                title: 'Bookmarks',
                titleColor: AppColor.white,
                isBackButton: true,
              ),
            ),

            /// Custom Tab Bar
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 16.w),
              child: TabBar(
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: Color(0xffEDE8FF),
                  borderRadius: BorderRadius.circular(32.r),
                ),
                indicatorPadding: EdgeInsets.symmetric(horizontal: 4.w),
                labelPadding: EdgeInsets.symmetric(horizontal: 4.w),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                unselectedLabelColor: AppColor.primaryColor,
                tabs: [
                  _buildTabItem(AppIcons.promptsIcon, 'Prompts', textTheme),
                  _buildTabItem(AppIcons.postIcon, 'Posts', textTheme),
                  _buildTabItem(AppIcons.mediaIcon, 'Media', textTheme),
                ],
              ),
            ),

            /// TabBar Views
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: TabBarView(
                  children: [
                    Center(child: Text('Prompts')),
                    Center(child: Text('Posts')),
                    Center(child: Text('Media')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Tab _buildTabItem(String iconPath, String label, TextTheme textTheme) {
    return Tab(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 20.w,
              height: 20.h,
            ),
            SizedBox(width: 6.w),
            Text(
              label,
              style: textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
