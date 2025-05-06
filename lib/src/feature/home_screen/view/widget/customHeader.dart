
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_header.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/feature/home_screen/Riverpod/ans_provider.dart';

import 'inputDecor.dart';

class CustomHeaderHome extends StatelessWidget {
  const CustomHeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
      final TextEditingController sendTextController =TextEditingController();

    //chat section starts here !
    return SizedBox(
      width: double.infinity,
    //  height: 356.h,
      child: Stack(
        children: [
          Container(
          //  height: 356.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff9EBA72),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
            child: Padding(
              padding:  AppPadding.screenHorizontalPadding,
              child: Consumer(
                builder: (context, ref,_) {
             final answerNotifier = ref.read(answerListProvider.notifier);
                 final isAnswerSent = ref.watch(isAnswerSentProvider);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                   SizedBox(height: 195.h,),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/parent_screen/msg.png",
                            height: 18,
                            width: 18,
                          ),
                          SizedBox(width: 8.w),
                          const Text(
                            "Daily Question",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff1D1F2C),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                       Text(
                        "If your relationship was kitchen appliance, what would it be?",
                        style: TextStyle(
                          fontSize: 24.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       SizedBox(height: 18.h),
                       if(!isAnswerSent)
                      TextFormField(
                        controller: sendTextController,
                        decoration: customInputDecoration(
                          hintText: "Write your answer",
                          prefixIcon: Image.asset(
                            "assets/images/parent_screen/clip.png",
                            height: 20,
                            width: 20,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                            final sendMsg = sendTextController.text.trim();

                            if(sendMsg.isNotEmpty){
                              answerNotifier.addAnswer("Myra",true, sendMsg);
                              sendTextController.clear();
                              debugPrint("\n msg add hoiseeee \n");
                              ref.watch(isAnswerSentProvider.notifier).state = true;
                            }
                            },
                            child: Image.asset(
                              "assets/images/parent_screen/next2.png",
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  );
                }
              ),
            ),
          ),

          /// App bar
          CommonHeader(
           backgroundColor: Color(0xffF4F8ED),
            backgroundContainerHeight: 175.h,
            bgImage: "assets/images/parent_screen/grp.png",
            child: CommonWidgets.customAppBar(
              titleColor: Color(0xff18062C),
              context: context,
              leadingImagePath: "assets/images/parent_screen/Avatar.png",
              title: "Angie’s Possy",
              subtitle: "GOOD MORNING",
              subtitleColor: Color(0xff4A4C56),
              subtitleImagePath: "assets/images/parent_screen/flower.png",

              actionWidgets: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 40.h,
                    width: 58.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: const Color(0xFFFFFFFF),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/parent_screen/fire.png",
                          height: 14.h,
                          width: 14.w,
                        ),
                        const Text(
                          "7d",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  CommonWidgets.circleButton(
                    imgPath: "assets/images/parent_screen/bell.png",
                    padding: EdgeInsets.all(10.r),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
