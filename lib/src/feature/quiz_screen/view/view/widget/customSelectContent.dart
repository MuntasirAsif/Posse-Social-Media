import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/feature/quiz_screen/view/view/widget/quiz_avatar.dart';
import 'package:possy_app/src/feature/quiz_screen/view/view/widget/quiz_bottomsheeet.dart';
import 'package:possy_app/src/feature/quiz_screen/view/view_model/select_provider.dart';

class CustomselectContent extends StatefulWidget {
  final int quizIndex;
  final String text;
  final int optionIndex;
  const CustomselectContent({super.key, required this.text, required this.quizIndex, required this.optionIndex});

  @override
  State<CustomselectContent> createState() => _CustomselectContentState();
}

class _CustomselectContentState extends State<CustomselectContent> {
  List<String> selectedImageUrls = [];

  @override
  Widget build(BuildContext context) {

    return Consumer(
      builder: (context, ref, _) {
      final quizState = ref.watch(quizSelectionProvider);
         // final bool isSelected = quizState.quizModel!.quizList![widget.quizIndex].options![widget.optionIndex].users!.length > 0;
            final bool isSelected = quizState.quizModel!.quizList![widget.quizIndex].options![widget.optionIndex].users!.isNotEmpty;
        return Container(
          width: 326.w,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color:  isSelected ? Color(0xffE9FAF7) : Color(0xffF6F8FA),
          ),
          
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 12.h,
              bottom: 12.h,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.text,
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    // Avatar Stack
                    QuizAvatarStack(imageUrls: selectedImageUrls),
        
                    Spacer(),

                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                        //  final quizModel = Grquizmodel();
                          showQuizbottomSheet(
                            quizIndex: widget.quizIndex,
                            optionIndex: widget.optionIndex,
                            context: context,
                            // quizItems: quizModel.quizItems,
                            onSelected: (images) {
                              // setState(() {
                              //   selectedImageUrls = images;
                              // });
                            },
                          );
                        },
                        child: Image.asset(
                          "assets/images/quizscreen/dotbutt.png",
                          height: 32.h,
                          width: 32.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
