import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/feature/vibe_check_screen/model/vibe_cehck_quiz_model.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../common_widget_style/common_style/vibe_check_style/vibe_check_color.dart';
import '../view_model/question_provider.dart';
import 'question_option_widgets.dart';

class VibeCheckQuizWidget extends ConsumerWidget {
  const VibeCheckQuizWidget({
    super.key,
    required this.textTheme,
    required this.vibeCheckQuizModel,
  });

  final TextTheme textTheme;
  final VibeCheckQuizModel vibeCheckQuizModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = ref.watch(
      QuestionNotifier.questionProvider(vibeCheckQuizModel.quizOption),
    );
    final notifier = ref.read(
      QuestionNotifier.questionProvider(vibeCheckQuizModel.quizOption).notifier,
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: VibeCheckColor.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(AppIcons.victory),
              SizedBox(width: 10.w),
              Text(
                "Vibe Check",
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            vibeCheckQuizModel.questionTitle,
            style: textTheme.headlineMedium,
          ),
          SizedBox(height: 16.h),
          Column(
            children: List.generate(
              options.length,
                  (index) => GestureDetector(
                onTap: () => notifier.select(index),
                child: QuestionOptionWidgets(
                  index: index,
                  options: options, textTheme: textTheme,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
