import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/src/common_widget_style/common_style/vibe_check_style/vibe_check_color.dart';
import 'package:possy_app/src/feature/vibe_check_screen/widgets/vibe_check_header.dart';
import 'package:possy_app/src/feature/vibe_check_screen/widgets/vibe_check_quiz.dart';

import 'view_model/dummy_data.dart';
import 'view_model/question_provider.dart';

class VibeCheckScreen extends ConsumerWidget {
  const VibeCheckScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: VibeCheckColor.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VibeCheckHeader(textTheme: textTheme),
          Expanded(
            child: SizedBox(
              child: Padding(
                padding: AppPadding.screenHorizontalPadding,
                child: ListView.builder(
                  itemCount: dummyVibeCheckQuizzes.length,
                  itemBuilder: (BuildContext context, int index) {
                    final formattedDate = ref
                        .read(
                          QuestionNotifier.questionProvider(
                            dummyVibeCheckQuizzes[index].quizOption,
                          ).notifier,
                        )
                        .getFormattedDate(
                          dummyVibeCheckQuizzes[index].dateTime,
                        );
                    return Column(
                      children: [
                        formattedDate != ''
                            ? Padding(
                              padding: EdgeInsets.only(top: 16.h, bottom: 18.h),
                              child: Row(
                                children: [
                                  Expanded(child: Divider()),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6.w,
                                      vertical: 2.h,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      color: Color(0xFFE6E0FF),
                                    ),
                                    child: Text(
                                      formattedDate,
                                      style: textTheme.bodyMedium!.copyWith(
                                        color: const Color(0xFF4A4C56),
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Divider()),
                                ],
                              ),
                            )
                            : SizedBox.shrink(),
                        VibeCheckQuizWidget(
                          textTheme: textTheme,
                          vibeCheckQuizModel: dummyVibeCheckQuizzes[index],
                        ),
                        if(index+1==dummyVibeCheckQuizzes.length)
                          SizedBox(height: 100.h,)
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
