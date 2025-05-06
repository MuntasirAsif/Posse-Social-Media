import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../core/constant/icons.dart';
import '../../../../../../../core/routes/route_name.dart';
import '../../../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../../../common_widget_style/common_style/account_style/account_color.dart';
import '../../../../../../common_widget_style/common_widgets/common_widgets.dart';

class MemberListPopUpMenuButton extends StatelessWidget {
  const MemberListPopUpMenuButton({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: AppColor.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      shadowColor: Colors.grey,
      splashRadius: 5,
      onSelected: (value) {
        if (value == 'Leave Posse') {
          CommonWidgets.customConfirmationBottomSheet(
            context: context,
            iconPath: AppIcons.leaveIcon,
            headerText: 'Are You Sure?',
            bodyText: 'Do you want to leave this posse?',
            confirmationButtonColor: AppColor.notifyRed,
            confirmButtonText: 'Leave',
            onConfirm: () {},
          );
        }
        if (value == 'Upgrade Posse') {
          context.push(RouteName.subscriptionScreen);
        }
        if (value == 'Make Admin') {
          CommonWidgets.customConfirmationBottomSheet(
            context: context,
            bodyWidget: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 80.w,
                      width: 80.w,
                      child: ClipOval(
                        child: Image.network(
                          'https://randomuser.me/api/portraits/men/1.jpg',
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: SvgPicture.asset(
                        AppIcons.memberListPremium,
                        height: 24.w,
                        width: 24.w,
                      ),
                    ),
                  ],
                ),
                Text('Are You Sure?', style: textTheme.titleMedium),
                Text(
                  'Do you want to make shroud an admin of this posse?',
                  style: textTheme.bodyMedium!.copyWith(
                    color: AccountColor.textSubColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            confirmationButtonColor: AppColor.primaryColor,
            confirmButtonText: 'Continue',
            onConfirm: () {},
          );
        }
      },
      itemBuilder:
          (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'Make Admin',
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.adminIcon,),
                  SizedBox(width: 8),
                  Text(
                    'Make Admin',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            PopupMenuItem<String>(
              value: 'Upgrade Posse',
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.crownIconManageSubscription,
                    color: Colors.black,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Upgrade Posse',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            PopupMenuItem<String>(
              value: 'Leave Posse',
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.leavePosse),
                  SizedBox(width: 8),
                  Text(
                    'Leave Posse',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: AppColor.notifyRed),
                  ),
                ],
              ),
            ),
          ],
      icon: Icon(Icons.more_horiz_outlined), // or any custom icon
    );
  }
}
