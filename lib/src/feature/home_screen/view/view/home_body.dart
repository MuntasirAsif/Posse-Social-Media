import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/feature/home_screen/Riverpod/ans_provider.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/customDatePick.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/day_container.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/reaction.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final msg = ref.watch(answerListProvider);
        final isAnsSent = ref.watch(isAnswerSentProvider);
        return ListView.builder(
          itemCount: msg.length,

          padding: EdgeInsets.symmetric(vertical: 20.h),
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            final ans = msg[index];
            return ans.hasAnswered
                ? Padding(
                  padding: EdgeInsets.only(bottom: 16, left: 18.w, right: 18.w),
                  child: Column(
                    children: [
                      if (index == 0)
                        Column(
                          children: [
                            DayContainer(
                              text: "Today",
                              onTap: () => selectDate(context),
                            ),
                            SizedBox(height: 13.h),
                          ],
                        ),

                      Row(
                        children: [
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
                                  color: const Color(0xFFF9EBA72),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 12.h,
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    ans.answer.toString(),
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge?.copyWith(
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 13.w),

                          Image.asset(
                            "assets/images/parent_screen/p1.png",
                            height: 42.h,
                            width: 42.w,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
                : Padding(
                  padding: EdgeInsets.only(bottom: 16, left: 18.w, right: 18.w),
                  child: Column(
                    children: [
                      if (index == 0)
                        Column(
                          children: [
                            DayContainer(
                              text: "Today",
                              onTap: () => selectDate(context),
                            ),
                            SizedBox(height: 13.h),
                          ],
                        ),

                      Row(
                        spacing: 13.w,
                        children: [
                          /// Profile Picture
                          Image.asset(
                            "assets/images/parent_screen/p1.png",
                            height: 42.h,
                            width: 42.w,
                          ),

                          /// Answer
                          Expanded(
                            child: GestureDetector(
                              onLongPressStart:
                                  (details) => showReactionMenu(
                                    context,
                                    details.globalPosition,
                                  ),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.r),
                                      color: const Color(
                                        0xFFFFFFFF,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                      vertical: 12.h,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ans.title,

                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          ans.answer.toString(),
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyLarge?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    width: double.infinity,
                                    height: 100,
                                    child: ClipRRect(
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
                          ),
                        ],
                      ),
                    ],
                  ),
                );
          },
        );
      },
    );
  }
}
