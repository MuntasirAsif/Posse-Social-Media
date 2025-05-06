import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../core/constant/icons.dart';
import '../../../../../../../../core/routes/route_name.dart';
import '../../../../../../../common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import '../../../../../../../common_widget_style/common_style/auth_style/auth_input_decoration_theme.dart';
import '../../../../../../../common_widget_style/common_widgets/common_widgets.dart';
import '../../../view_model/sign_up_provider.dart';

Widget signupInputContent({required BuildContext context}){
  return Column(
    children: [
      SizedBox(height: 16.h),
      TextFormField(
        decoration:
        AuthInputDecorationTheme.lightInputDecorationTheme(
          context: context,
          hintText: "Your email",
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 4.w),
            child: SvgPicture.asset(AppIcons.mailIcon),
          ),
        ),
      ),
      SizedBox(height: 16.h),
      TextFormField(
        decoration:
        AuthInputDecorationTheme.lightInputDecorationTheme(
          context: context,
          hintText: "Date of birth",
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 4.w),
            child: SvgPicture.asset(AppIcons.calenderIcon),
          ),
        ),
      ),
      SizedBox(height: 16.h),
      Consumer(
          builder: (context,ref,child) {
            final isPasswordVisible = ref.watch(signUpProvider).isPasswordVisible;
            final notifier = ref.read(signUpProvider.notifier);
            return TextFormField(
              obscureText: !isPasswordVisible,
              decoration:
              AuthInputDecorationTheme.lightInputDecorationTheme(
                context: context,
                hintText: "Create your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 4.w),
                  child: SvgPicture.asset(AppIcons.lockIcon),
                ),
                suffixIcon: GestureDetector(
                  onTap: (){
                    notifier.togglePasswordVisibility();
                    debugPrint("\n\ntoggle password visibility: $isPasswordVisible\n");
                  },
                  child: Icon(
                    isPasswordVisible ?  Icons.visibility_outlined : Icons.visibility_off_outlined,
                    size: 20.r,
                    color: Color(0xFF777980),
                  ),
                ),
              ),
            );
          }
      ),
      SizedBox(height: 16.h),
      Consumer(
          builder: (context,ref,child) {
            final isConfirmPasswordVisible = ref.watch(signUpProvider).isConfirmPasswordVisible;
            final notifier = ref.read(signUpProvider.notifier);

            return TextFormField(
              obscureText: !isConfirmPasswordVisible,
              decoration:
              AuthInputDecorationTheme.lightInputDecorationTheme(
                context: context,
                hintText: "Confirm your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 4.w),
                  child: SvgPicture.asset(AppIcons.lockIcon),
                ),
                suffixIcon: GestureDetector(
                  onTap: (){
                    notifier.toggleConfirmPasswordVisibility();

                  },
                  child: Icon(
                    isConfirmPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    size: 20.r,
                    color: Color(0xFF777980),
                  ),
                ),
              ),
            );
          }
      ),
      SizedBox(height: 32.h),
      CommonWidgets.primaryButton(
        context: context,
        title: "Continue",
        color: AuthColorPalette.primary,
        textColor: AuthColorPalette.white,
        onPressed: () {
          context.pushNamed(RouteName.signUpOTPScreen);
        },
      ),
      SizedBox(height: 32.h),
    ],
  );
}