import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:possy_app/src/common_widget_style/common_style/timeline_style/timeline_color.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/spacer/auto_spacer.dart';

import '../theme/src/theme_extension/color_pallete.dart';

class Utils {
  static void showSnackBar(
    String message,
    BuildContext context, {
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor ?? Colors.black87,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static String formatDate({
    required DateTime dateTime,
    required String formatType,
  }) {
    switch (formatType) {
      case 'yyyy-MM-dd':
        // Format: 2025-04-10
        return DateFormat('yyyy-MM-dd').format(dateTime);

      case 'dd-MM-yyyy':
        // Format: 10-04-2025
        return DateFormat('dd-MM-yyyy').format(dateTime);

      case 'MMM dd, yyyy':
        // Format: Apr 10, 2025
        return DateFormat('MMM dd, yyyy').format(dateTime);

      case 'dd MMM yyyy':
      // Format: 10 Apr 2025
        return DateFormat('dd MMM yyyy').format(dateTime);

      case 'EEEE, MMM d':
        // Format: Thursday, Apr 10
        return DateFormat('EEEE, MMM d').format(dateTime);

      case 'h:mm a':
        // Format: 5:30 PM (12-hour clock with AM/PM)
        return DateFormat('h:mm a').format(dateTime);

      default:
        // Fallback: default to ISO format
        return DateFormat('yyyy-MM-dd').format(dateTime);
    }
  }

  static String maskCardNumber(String cardNumber) {
    return '**** **** **** ${cardNumber.substring(cardNumber.length - 4)}';
  }

  static String? validateDropdown<T>(T? value, String message) {
    if (value == null || (value is String && value.isEmpty)) {
      return message;
    }
    return null;
  }

  static AppBar appBarBackButton(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: ImageIcon(AssetImage('assets/icons/back.png'), size: 26.r),
      ),

      ///size: 20.r
    );
  }

  static Widget accountOptionTile({
    required String title,
    Color? titleColor,
    String? email,
    required String leadingAsset,
    required Color avatarBackgroundColor,
    required BuildContext context,
    required VoidCallback onPressed,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(4.w),
        margin: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Leading Avatar
            CircleAvatar(
              radius: 26.r,
              backgroundColor: avatarBackgroundColor,
              child: Image.asset(leadingAsset),
            ),
            SizedBox(width: 12),

            // Title and trailing content
            Expanded(
              child: Row(
                children: [
                  // Title
                  Expanded(
                    child: Text(
                      title,
                      style: textTheme.bodyLarge!.copyWith(
                        color: titleColor ?? AppColor.primaryTextColor,
                      ),
                    ),
                  ),

                  // Email + Arrow
                  SizedBox(
                    width: email != null ? 120.w : 30.w,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            email ?? '',
                            style: textTheme.bodySmall!.copyWith(
                              color: AppColor.bodyTextColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> openBottomSheet(BuildContext context, Widget child) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.minimize_rounded, size: 60),
              AutoSpacer(space: 10.h),
              child,
              AutoSpacer(space: 24.h),
            ],
          ),
        );
      },
    );
  }
}
