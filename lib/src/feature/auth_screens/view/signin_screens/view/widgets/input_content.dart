import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../core/constant/icons.dart';
import '../../../../../../../core/routes/route_name.dart';
import '../../../../../../common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import '../../../../../../common_widget_style/common_style/auth_style/auth_input_decoration_theme.dart';
import '../../../../../../common_widget_style/common_widgets/common_widgets.dart';
import '../../../../../parents_screens/view_Model/parents_screen_provider.dart';
import '../../view_model/sign_in_provider.dart';

Widget inputContent({required BuildContext context}){


  final bodyLarge = Theme.of(context).textTheme.bodyLarge;

  return Column(
    children: [
      TextFormField(
        decoration: AuthInputDecorationTheme.lightInputDecorationTheme(
          context: context,
          hintText: "Your Email",
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 4.w),
            child: SvgPicture.asset(AppIcons.mailIcon,fit: BoxFit.cover,),
          ),
        ),
      ),
      SizedBox(height: 16.h),
      Consumer(
          builder: (context,ref,child) {

            final isPasswordVisible = ref.watch(signInProvider).isPasswordVisible;
            final notifier = ref.read(signInProvider.notifier);

            return TextFormField(
              obscureText: !isPasswordVisible,
              decoration: AuthInputDecorationTheme.lightInputDecorationTheme(
                context: context,
                hintText: "Enter your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 4.w),
                  child: SvgPicture.asset(AppIcons.lockIcon,fit: BoxFit.cover,),
                ),
                suffixIcon: GestureDetector(
                  onTap: (){
                    notifier.togglePasswordVisibility();
                  },
                  child: Icon(
                    isPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    size: 20.r,
                    color: AuthColorPalette.bodyTextColor,
                  ),
                ),
              ),
            );
          }
      ),
      SizedBox(height: 16.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer(
                  builder: (context,ref,child) {
                    final isRemember = ref.watch(signInProvider).isRemember;
                    final notifier = ref.read(signInProvider.notifier);

                    return GestureDetector(
                      onTap: (){
                        notifier.toggleIsRemember();
                      },
                      child: Icon(
                        isRemember ? Icons.check_circle_rounded : Icons.circle_outlined,
                        color: AuthColorPalette.selectionBlue,
                      ),
                    );
                  }
              ),
              SizedBox(width: 4.w),
              Text(
                "Remember me",
                style: bodyLarge?.copyWith(
                    color: AuthColorPalette.textColorGrey
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: (){
              context.go(RouteName.emailVerifyScreen);
            },
            child: Text(
              "Forgot Password?",
              style: bodyLarge?.copyWith(color: AuthColorPalette.selectionBlue),
            ),
          ),
        ],
      ),
      SizedBox(height: 44.h),
      Consumer(
          builder: (context,ref,child) {
            return CommonWidgets.primaryButton(context: context, title: "Log in", color: AuthColorPalette.primary,textColor: AuthColorPalette.white, onPressed: (){
              context.go(RouteName.parentsScreen);

              ref.read(parentsScreenProvider.notifier).onSelectedIndex(2);

              debugPrint("Selected index: ${ref.read(parentsScreenProvider).selectedIndex}");
            });
          }
      ),
      SizedBox(height: 44.h),
    ],
  );
}