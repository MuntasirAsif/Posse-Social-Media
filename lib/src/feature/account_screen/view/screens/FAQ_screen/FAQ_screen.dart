import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/src/common_widget_style/common_style/account_style/account_color.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_header.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/feature/account_screen/view/screens/FAQ_screen/widgets/faq_question.dart';
import 'package:possy_app/src/feature/account_screen/view_model/faq_riverpod.dart';
import '../../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../data/faq_data.dart';

class FaqScreen extends ConsumerWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          CommonHeader(
            backgroundColor: AccountColor.backgroundColor,
            backgroundContainerHeight: 112.h,
            child: CommonWidgets.customAppBar(
              context: context,
              title: "FAQ's",
              titleColor: AppColor.white,
              isBackButton: true,
            ),
          ),

          Expanded(
            child: Padding(
              padding: AppPadding.screenHorizontalPadding,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: faqList.length,
                itemBuilder: (context, index) {
                  final faqProvider = ref.watch(faqNotifierProvider);
                  return FaqQuestion(
                    isExpanded: faqProvider[index].isExpanded,
                    question: faqProvider[index].question,
                    answer: faqProvider[index].answer,
                    onTap: () {
                      ref.read(faqNotifierProvider.notifier).toggleFAQ(index);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
