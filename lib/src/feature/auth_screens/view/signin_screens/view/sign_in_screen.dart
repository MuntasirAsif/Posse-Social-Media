import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/core/utils/utils.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_input_decoration_theme.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/feature/auth_screens/view/auth_widgets/footer_text.dart';
import 'package:possy_app/src/feature/auth_screens/view/signin_screens/view/widgets/custom_login_button.dart';
import 'package:possy_app/src/feature/auth_screens/view/signin_screens/view/widgets/input_content.dart';
import 'package:possy_app/src/feature/auth_screens/view/signin_screens/view_model/sign_in_provider.dart';
import 'package:possy_app/src/feature/parents_screens/view_Model/parents_screen_provider.dart';

import '../../../../../../core/constant/icons.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {

    /// text theme
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final titleSmall = Theme.of(context).textTheme.titleSmall;
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;

    return Scaffold(
      // appBar: Utils.appBarBackButton(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  'Hi! Welcome Back',
                  style: headlineSmall?.copyWith(
                    color: AuthColorPalette.titleColor,
                  ),
                ),
                Text(
                  "Log in to your account_style",
                  style: titleSmall?.copyWith(
                      color: AuthColorPalette.textColorGreyscale,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 40.h),

                /// body input content
                inputContent(context: context),

                /// 'or' separator
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Divider(color: AuthColorPalette.greyscale200,height: 1,)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17.w),
                      child: Text("Or",style: bodyMedium?.copyWith(color: AuthColorPalette.textColorGrey, fontWeight: FontWeight.w500),),
                    ),
                    Expanded(child: Divider(color: AuthColorPalette.greyscale200,height: 1,)),
                  ],
                ),

                /// footer content
                SizedBox(height: 44.h,),
                buildLoginButton(context: context,imagePath: AppIcons.googleIcon,title: "Continue with Google"),
                SizedBox(height: 16.h,),
                buildLoginButton(context: context,imagePath: AppIcons.appleIcon,title: "Continue with Apple"),
                SizedBox(height: 32.h,),
                footerText(context: context, text1: "Don't have an account_style? ", text2: 'Sign Up', onTap: (){}),

              ],
            ),
          ),
        ),
      ),
    );
  }


}