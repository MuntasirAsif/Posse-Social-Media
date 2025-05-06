import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:possy_app/src/feature/onboarding_screens/view/widgets/onboarding_bottom_content.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final headLineLarge = Theme.of(context).textTheme.headlineLarge;

    return Stack(
      fit: StackFit.expand,
      children: [
        /// Background Image
        Container(
          color: AuthColorPalette.primary,
          child: SvgPicture.asset(AppImages.authBackground, fit: BoxFit.cover),
        ),

        /// App Title
        Positioned(
          top: 125.h,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              "POSSE",
              style: headLineLarge?.copyWith(
                color: AuthColorPalette.white,
                fontSize: 44.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

        /// Bottom Container
        const Align(
          alignment: Alignment.bottomCenter,
          child: OnboardingBottomContent(),
        ),
      ],
    );
  }
}
