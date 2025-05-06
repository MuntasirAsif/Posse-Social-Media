import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/feature/home_screen/Riverpod/ans_provider.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/button.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/inputDecor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void showCustomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      TextEditingController sendtext = TextEditingController();
      return SingleChildScrollView(
        reverse: true,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),

        child: IntrinsicHeight(
          child: ClipPath(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Color(0xFFDAF3F2),
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Consumer(
                builder: (context, ref, _) {
                  final msg = ref.read(answerListProvider.notifier);
                  final msgg = ref.watch(answerListProvider);
                  final isAnsSent = ref.watch(isAnswerSentProvider);
                  return Column(
                    children: [
                      Center(
                        child: Container(
                          height: 5.w,
                          width: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color(0xff171717),
                          ),
                        ),
                      ),
                      SizedBox(height: 18.h),
                      Image.asset(
                        "assets/images/parent_screen/bb.png",
                        height: 68.88.h,
                        width: 342.w,
                      ),
                      Image.asset("assets/images/parent_screen/q1.png"),
                      Text(
                        "If your relationship was kitchen appliance, what would it be?",
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff1D1F2C),
                        ),
                      ),
                      SizedBox(height: 15.h),

                      SizedBox(
                        width: 350.w,
                        height: 300.h,
                        child: Scrollbar(
                          child: ListView.builder(
                            itemCount: msgg.length,
                            itemBuilder: (context, index) {
                              final textSent = msgg[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/parent_screen/p1.png",
                                      height: 42.h,
                                      width: 42.w,
                                    ),
                                    SizedBox(width: 13.w),
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              color: const Color(0xFFFFFFFF),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16.w,
                                              vertical: 12.h,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(textSent.title),
                                                SizedBox(height: 10),
                                                Text(
                                                  textSent.answer
                                                      .toString(),
                                                ),
                                              ],
                                            ),
                                          ),
                                           SizedBox(
                                    width: double.infinity,
                                    height: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.r),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: isAnsSent ? 0 : 5,
                                          sigmaY: isAnsSent ? 0 : 5,
                                        ),
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                       color: Colors.white.withOpacity(0.2),

                                        ),
                                      ),
                                    ),
                                  ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      SizedBox(height: 16.h),

                      SizedBox(
                        width: 350.w,
                        height: 80.h,
                        child: TextFormField(
                          controller: sendtext,
                          expands: true,
                          maxLines: null,
                          textAlignVertical: TextAlignVertical.top,
                          decoration: customInputDecoration(
                            hintText: "Write your answer",
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(top: 30.h),
                              child: Image.asset(
                                "assets/images/parent_screen/smily.png",
                                height: 24,
                                width: 24,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 16.h),

                      Row(
                        children: [
                          Expanded(
                            child: Mybutton(
                              color: const Color(0xffFAFAFA),
                              text: "Skip",
                              onTap: () => Navigator.pop(context),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Mybutton(
                              color: const Color(0xff54BABC),
                              text: "Submit",
                              onTap: () {
                                final sendMsg = sendtext.text.trim();

                                if (sendMsg.isNotEmpty) {
                                  msg.addAnswer("myra", true, sendMsg);
                                  sendtext.clear();
                                  debugPrint("\n msg add hoiseeee \n");
                                  ref
                                      .watch(isAnswerSentProvider.notifier)
                                      .state = true;
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      );
    },
  );
}
