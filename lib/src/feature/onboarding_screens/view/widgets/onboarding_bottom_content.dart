import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:possy_app/src/feature/onboarding_screens/view/widgets/custom_button.dart';

class OnboardingBottomContent extends StatelessWidget {
  const OnboardingBottomContent({super.key});

  @override
  Widget build(BuildContext context) {
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.52,
      decoration: BoxDecoration(
        color: AuthColorPalette.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.w),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 70.h),
            Text(
              "Let's Get Started",
              style: headlineSmall?.copyWith(
                color: AuthColorPalette.titleColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "If you want to join the conversation, \nplease log in or sign up.",
              style: bodyLarge?.copyWith(
                color: AuthColorPalette.bodyTextColor,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 44.h),
            buildContainerButton(
              context: context,
              imagePath: AppIcons.loginIcon,
              title: "Proceed to Login",
              color: AuthColorPalette.secondary,
              textColor: AuthColorPalette.titleColor,
              circleColor: AuthColorPalette.white,
              onTap: () => context.push(RouteName.signInScreen),
            ),
            SizedBox(height: 12.h),
            buildContainerButton(
              context: context,
              imagePath: "assets/icons/auth_screens_svg/user-add.svg",
              title: "New User? Sign Up",
              color: AuthColorPalette.primary,
              textColor: AuthColorPalette.white,
              iconColor: AuthColorPalette.white,
              circleColor: AuthColorPalette.white.withOpacity(0.14),
              onTap: () => context.push(RouteName.signUpScreen),
            ),

          ],
        ),
      ),
    );
  }
}
