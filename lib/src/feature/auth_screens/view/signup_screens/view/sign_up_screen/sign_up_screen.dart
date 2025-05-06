import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/core/routes/route_name.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_input_decoration_theme.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/feature/auth_screens/view/signup_screens/view/sign_up_screen/parts/signup_input_content.dart';
import 'package:possy_app/src/feature/auth_screens/view/signup_screens/view_model/sign_up_provider.dart';

import '../../../../../../../core/constant/icons.dart';
import '../../../auth_widgets/footer_text.dart';
import '../../../signin_screens/view/widgets/custom_login_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    /// Text Theme
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final titleSmall = Theme.of(context).textTheme.titleSmall;
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;

    return Scaffold(
      // appBar: Utils.appBarBackButton(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Your Account',
                  style: headlineSmall?.copyWith(
                    color: AuthColorPalette.titleColor,
                  ),
                ),
                Text(
                  "Sign up and enjoy your experience",
                  style: titleSmall?.copyWith(
                      color: AuthColorPalette.textColorGreyscale,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 32.h),
                TextFormField(
                  decoration:
                      AuthInputDecorationTheme.lightInputDecorationTheme(
                        context: context,
                        hintText: "Your name",
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 16.w, right: 4.w),
                          child: SvgPicture.asset(AppIcons.personIcon),
                        ),
                      ),
                ),

               /// input content
                signupInputContent(context: context),

                /// "or" separator
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Divider(color: AuthColorPalette.greyscale200, height: 1),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17.w),
                      child: Text("Or",style: bodyMedium?.copyWith(color: AuthColorPalette.textColorGrey, fontWeight: FontWeight.w500),),
                    ),
                    Expanded(
                      child: Divider(color: AuthColorPalette.greyscale200, height: 1),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),

                /// footer content
                buildLoginButton(
                  context: context,
                  imagePath: AppIcons.googleIcon,
                  title: "Continue with Google",
                ),
                SizedBox(height: 16.h),
                buildLoginButton(
                  context: context,
                  imagePath: AppIcons.appleIcon,
                  title: "Continue with Apple",
                ),
                SizedBox(height: 24.h),
                footerText(context: context, text1: "Already have an account_style? ", text2: 'Log In', onTap: (){}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
