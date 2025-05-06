import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_header.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/inputDecor.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/reaction.dart';

class msgScreen extends StatelessWidget {
  const msgScreen({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1FAF9),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          CommonHeader(
            backgroundColor: Color(0xff7ADFCE),
            backgroundContainerHeight: 120.h,
            child: CommonWidgets.customAppBar(
              margin: EdgeInsets.all(0),
              context: context,
              title: 'Group Quiz',
              titleColor: Colors.black,
              leadingButtonOnTap: () {
                Navigator.pop(context);
              },
              leadingImagePath: "assets/icons/backblack.png",
             
            ),
          ),
      
          /// Chat Messages
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: 16,
                    left: 18.w,
                    right: 18.w,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/parent_screen/p1.png",
                        height: 42.h,
                        width: 42.w,
                      ),
                      SizedBox(width: 13.w),
                      Expanded(
                        child: GestureDetector(
                          onLongPressStart:
                              (details) => showReactionMenu(
                                context,
                                details.globalPosition,
                              ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: const Color(0xFFFFFFFF),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Maren"),
                                SizedBox(height: 10),
                                Text(
                                  "Are we using the correct font and chat bubble?",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
      
      
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
            child: TextFormField(decoration: customInputDecoration(
              hintText: "Write your answer",
              suffixIcon: Image.asset(AppIcons.nextIcon),
              prefixIcon:Image.asset(AppIcons.clipIcon),
            )),
          ),
          SizedBox(height: 26.h,)
        ],
      ),
    );
  }
}
