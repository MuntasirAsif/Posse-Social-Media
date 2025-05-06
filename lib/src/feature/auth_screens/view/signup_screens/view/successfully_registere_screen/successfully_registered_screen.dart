import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';

import '../../../../../../../core/constant/icons.dart';

class SuccessfullyRegisteredScreen extends StatelessWidget {
  const SuccessfullyRegisteredScreen({super.key});

  @override
  Widget build(BuildContext context) {

    /// Text Theme
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                SvgPicture.asset(AppIcons.registerIcon),
                SizedBox(height: 40.h),
                Text(
                  "Successfully Registered",
                  style: headlineSmall?.copyWith(
                    color: AuthColorPalette.titleColor,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:  32.0),
                  child: Text(
                    "Your account_style has been registered successfully, now let’s enjoy core features!",
                    textAlign: TextAlign.center,

                    style: bodyLarge?.copyWith(color:AuthColorPalette.bodyTextColor),
                  ),
                ),
               Spacer(),
                CommonWidgets.primaryButton(
                  context: context,
                  title: "Create or Join?",
                  color: AuthColorPalette.primary,
                  textColor: AuthColorPalette.white,
                  onPressed: () {
                    context.go(RouteName.crateOrJoinScreen);
                  },
                ),
                SizedBox(height: 56.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
