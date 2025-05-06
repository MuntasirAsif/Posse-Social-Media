// widget/custom_container.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/feature/quiz_screen/view/view/widget/customSelectContent.dart';
import 'package:possy_app/src/model/grQuizModel.dart';
import '../comment_screen/comment_Screen.dart';

class CustomContainer extends StatelessWidget {
  final QuizList quiz;
  final int quizIndex;

  const CustomContainer({super.key, required this.quiz, required this.quizIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Color(0xffFFFFFF),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            Row(
              children: [
                Image.asset("assets/images/parent_screen/q11.png"),
                SizedBox(width: 4.w),
                Text(
                 "Group Quiz",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff389EA2),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),

            /// Question
            Text(
              quiz.question ?? "",
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 16.h),

            ...quiz.options!.asMap().entries.map((entry) {
              final index = entry.key; // Get index of each option
              final option = entry.value.option; // Get the option string
              return Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: CustomselectContent(
                  text: option ?? "",
                  quizIndex: quizIndex,
                  optionIndex: index,
                ), // Pass index as the parameter
              );
            }),

            /// Comment Button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => msgScreen(textTheme: TextTheme()),
                  ),
                );
              },
              child: Center(
                child: Container(
                  width: 131.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Color(0xff389EA2),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 11.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/quizscreen/cmnt.png",
                        height: 15.h,
                        width: 15.w,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "Comment",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
