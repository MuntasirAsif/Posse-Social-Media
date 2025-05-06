import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/core/theme/src/theme_extension/color_pallete.dart';

import '../../../../../core/constant/icons.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../common_widget_style/common_style/account_style/account_color.dart';
import '../../../../common_widget_style/common_widgets/common_widgets.dart';
import '../editting_field/change_email.dart';
import '../editting_field/change_name.dart';
import '../editting_field/change_password.dart';

class AccountWidgetList {
  static List<Widget> manageAccount(BuildContext context) => [
    Utils.accountOptionTile(
      context: context,
      title: 'Profile Information',
      leadingAsset: AppIcons.accountProfileIcon,
      avatarBackgroundColor: AccountColor.manageAccountBg,
      onPressed: () {
        context.push(RouteName.editProfileScreen);
      },
    ),
    Utils.accountOptionTile(
      context: context,
      title: 'Language Preferences',
      leadingAsset: AppIcons.accountLanguagePreference,
      avatarBackgroundColor: AccountColor.manageAccountBg,
      onPressed: () {
        context.push(RouteName.languagePreferencesScreen);
      },
    ),
    Utils.accountOptionTile(
      context: context,
      title: 'Notification Preferences',
      leadingAsset: AppIcons.accountNotificationPreference,
      avatarBackgroundColor: AccountColor.manageAccountBg,
      onPressed: () {
        context.push(RouteName.manageNotificationScreen);
      },
    ),
    Utils.accountOptionTile(
      context: context,
      title: 'Manage Subscription',
      leadingAsset: AppIcons.accountSubscriptionPreference,
      avatarBackgroundColor: AccountColor.manageAccountBg,
      onPressed: () {
        context.push(RouteName.subscriptionScreen);
      },
    ),
  ];

  static List<Widget> posse(BuildContext context) => [
    Utils.accountOptionTile(
      context: context,
      title: 'Members',
      leadingAsset: AppIcons.accountBookMark,
      avatarBackgroundColor: AccountColor.posseBg,
      onPressed: () {
        context.push(RouteName.memberListScreen);
      },
    ),
    Utils.accountOptionTile(
      context: context,
      title: 'Bookmarks',
      leadingAsset: AppIcons.accountPosseUser,
      avatarBackgroundColor: AccountColor.posseBg,
      onPressed: () {
        context.push(RouteName.bookmarksScreen);
      },
    ),
  ];

  static List<Widget> helpSupport(BuildContext context) => [
    Utils.accountOptionTile(
      context: context,
      title: 'View FAQs',
      leadingAsset: AppIcons.accountSupportUser,
      avatarBackgroundColor: AccountColor.supportBg,
      onPressed: () {
        context.push(RouteName.faqScreen);
      },
    ),
    Utils.accountOptionTile(
      context: context,
      title: 'Logout',
      leadingAsset: AppIcons.accountLogout,
      avatarBackgroundColor: AccountColor.supportBg,
      onPressed: () {
        CommonWidgets.customConfirmationBottomSheet(
            context: context,
            confirmButtonText: 'Logout',
            onConfirm: (){

            },
            iconPath: AppIcons.logoutIconButton,
            bodyText: 'Do you want to logout?',
            headerText: 'Are You Sure?',
            confirmationButtonColor: AppColor.notifyRed
        );
      },
    ),
  ];

  static List<Widget> editProfile(BuildContext context) => [
    Utils.accountOptionTile(
      context: context,
      title: 'Change Name',
      leadingAsset: AppIcons.userEditProfile,
      avatarBackgroundColor: AppColor.surfaceColor,
      onPressed: () {
        Utils.openBottomSheet(context,ChangeName());
      },
    ),
    Utils.accountOptionTile(
      context: context,
      title: 'Email',
      email: 'James@gmail.com',
      leadingAsset: AppIcons.emailEditProfile,
      avatarBackgroundColor: AppColor.surfaceColor,
      onPressed: () {
        Utils.openBottomSheet(context,ChangeEmail());
      },
    ),
    Utils.accountOptionTile(
      context: context,
      title: 'Change Password',
      leadingAsset: AppIcons.changePassEditProfile,
      avatarBackgroundColor: AppColor.surfaceColor,
      onPressed: () {
        Utils.openBottomSheet(context,ChangePassword());
      },
    ),
    Utils.accountOptionTile(
      context: context,
      title: 'Logout',
      titleColor: AppColor.notifyRed,
      leadingAsset: AppIcons.accountLogout,
      avatarBackgroundColor: AccountColor.supportBg,
      onPressed: () {
        CommonWidgets.customConfirmationBottomSheet(
            context: context,
            confirmButtonText: 'Delete',
            onConfirm: (){

            },
            iconPath: AppIcons.trashEditProfile,
          bodyText: 'Do you want to delete this account?',
          headerText: 'Are You Sure?',
          confirmationButtonColor: AppColor.notifyRed
        );
      },
    ),
  ];
}
