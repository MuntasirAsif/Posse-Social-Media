import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/src/common_widget_style/common_style/vibe_check_style/vibe_check_color.dart';
import '../model/quiz_option_Model.dart';
import '../view_model/question_provider.dart';
import 'avatar_stack.dart';

class QuestionOptionWidgets extends ConsumerWidget {
  final int index;
  final List<QuizOption> options;
  final TextTheme textTheme;

  const QuestionOptionWidgets({
    super.key,
    required this.index,
    required this.options,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentOption = ref.watch(QuestionNotifier.questionProvider(options))[index];
    final notifier = ref.read(QuestionNotifier.questionProvider(options).notifier);

    return GestureDetector(
      onTap: () => notifier.select(index),
      child: Container(
        padding: EdgeInsets.all(16.w),
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color:
              currentOption.isSelected
                  ? VibeCheckColor.selectedOptionColor
                  : VibeCheckColor.unselectedOptionColor,
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          border: Border.all(
            color:
                currentOption.isSelected
                    ? Colors.deepPurple
                    : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            currentOption.isSelected
                ? Icon(Icons.check_circle, color: Colors.deepPurple, size: 24.r)
                : SizedBox(),
            SizedBox(width: 10.w),

            /// Title
            Expanded(
              child: Text(
                currentOption.title,
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color:
                      currentOption.isSelected
                          ? Colors.deepPurple
                          : Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
              ),
            ),

            /// Avatar Stack
            GestureDetector(
              onTap:
                  () =>
                      showSelectorBottomSheet(context, currentOption.imageUrls),
              child: SizedBox(
                height: 40.h,
                width: 100.w,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AvatarStack(
                    imageUrls: currentOption.imageUrls,
                    maxDisplay: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSelectorBottomSheet(BuildContext context, List<String> imageUrls) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (BuildContext context) {
        return BuildBottomSheetWidget(imageUrls: imageUrls,);
      },
    );
  }
}

class BuildBottomSheetWidget extends StatelessWidget {
  const BuildBottomSheetWidget({
    super.key, required this.imageUrls,
  });
  final List<String> imageUrls;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(CupertinoIcons.minus, size: 50),
          SizedBox(height: 10.h),
          ...imageUrls.map((imageUrl) {
            return Container(
              width: 365.w,
              padding: AppPadding.screenHorizontalPadding,
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 22.r,
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                    title: Row(
                      children: [
                        Text(
                          'Mr. Smith',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(width: 8.w),
                        if (imageUrl ==
                            'https://randomuser.me/api/portraits/men/1.jpg')
                          Image.asset(AppImages.premiumImage),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context, imageUrl);
                    },
                  ),
                  SizedBox(height: 16),
                  if (imageUrl != imageUrls.last)
                    Divider(thickness: 1.5, height: 12.h),
                ],
              ),
            );
          }),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
