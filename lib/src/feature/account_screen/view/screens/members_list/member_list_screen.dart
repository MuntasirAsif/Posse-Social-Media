import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/spacer/auto_spacer.dart';
import 'package:possy_app/src/feature/account_screen/view/screens/members_list/widget/member_list_tile.dart';

import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../../common_widget_style/common_style/account_style/account_color.dart';
import '../../../../../common_widget_style/common_widgets/common_header.dart';
import '../../../../../common_widget_style/common_widgets/common_widgets.dart';

class MemberListScreen extends StatelessWidget {
  const MemberListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonHeader(
            backgroundColor: AccountColor.backgroundColor,
            backgroundContainerHeight: 112.h,
            child: CommonWidgets.customAppBar(
              context: context,
              title: 'Angie’s posse',
              titleColor: AppColor.white,
              isBackButton: true,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: AppPadding.screenHorizontalPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Admin',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AccountColor.textSubColor,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child:
                      MemberListTile(
                        name: 'Messi',
                        isMe: false,
                        isPremium: false,
                      ),
                    ),
                    Text(
                      'Members',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AccountColor.textSubColor,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        children: [
                          MemberListTile(
                            name: 'Angie',
                            isMe: true,
                            isPremium: true,
                          ),
                          MemberListTile(
                            name: 'Safrid',
                            isMe: false,
                            isPremium: true,
                          ),
                          MemberListTile(
                            name: 'Anagie',
                            isMe: false,
                            isPremium: false,
                          ),
                          MemberListTile(
                            name: 'Kaka',
                            isMe: false,
                            isPremium: false,
                          ),
                          MemberListTile(
                            name: 'Angie',
                            isMe: true,
                            isPremium: false,
                          ),
                          MemberListTile(
                            name: 'Angie',
                            isMe: false,
                            isPremium: false,
                          ),
                          MemberListTile(
                            name: 'Messi',
                            isMe: false,
                            isPremium: false,
                          ),
                          MemberListTile(
                            name: 'Angie',
                            isMe: false,
                            isPremium: false,
                          ),
                          MemberListTile(
                            name: 'Ronaldo',
                            isMe: false,
                            isPremium: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
