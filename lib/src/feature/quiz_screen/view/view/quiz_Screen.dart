import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/src/feature/quiz_screen/view/view/widget/custom_container.dart';
import 'package:possy_app/src/feature/quiz_screen/view/view/widget/quizHeader.dart';
import 'package:possy_app/src/feature/quiz_screen/view/view_model/select_provider.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Color(0xffF1FAF9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuizeHeader(textTheme: textTheme),
          Expanded(
            child: Padding(
              padding: AppPadding.screenHorizontalPadding,
              child: Consumer(
                builder: (_, ref, _) {

                  final quizWatchState = ref.watch(quizSelectionProvider);

                  return ListView.builder(
                    padding: EdgeInsets.only(top: 24.h, bottom: 20.h),
                    itemCount: quizWatchState.quizModel!.quizList!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: CustomContainer(quiz: quizWatchState.quizModel!.quizList![index],quizIndex: index,),
                      );
                    },
                  );
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}
