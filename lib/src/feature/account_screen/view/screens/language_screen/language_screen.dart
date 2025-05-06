import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/core/theme/src/theme_extension/color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_style/account_style/account_color.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_header.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/feature/account_screen/data/language_list.dart';
import 'package:possy_app/src/feature/account_screen/view_model/language_riverpod.dart';

class LanguageScreen extends ConsumerWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languages = ref.watch(
      LanguageNotifier.languageProvider(LanguageList.languageList),
    );

    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          CommonHeader(
            backgroundColor: AccountColor.backgroundColor,
            backgroundContainerHeight: 112.h,
            child: CommonWidgets.customAppBar(
              context: context,
              title: 'Languages Preferences',
              titleColor: AppColor.white,
              isBackButton: true,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeInOut,
                child: ListView(
                  key: ValueKey(languages.map((e) => e.languageName).join(',')),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: [
                    for (int index = 0; index < languages.length; index++)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (languages[index].isSelected) ...[
                            Text("My Languages", style: textTheme.bodyMedium),
                            SizedBox(height: 10.h),
                          ],
                          AnimatedContainer(
                            key: ValueKey(languages[index].languageName),
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                            decoration: BoxDecoration(
                              color:
                                  languages[index].isSelected
                                      ? Colors.grey.shade200
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              leading: Image.asset(languages[index].images),
                              title: Text(languages[index].languageName),
                              trailing:
                                  languages[index].isSelected
                                      ? Image.asset(AppIcons.checkBox)
                                      : null,
                              onTap: () {
                                ref
                                    .read(
                                      LanguageNotifier.languageProvider(
                                        LanguageList.languageList,
                                      ).notifier,
                                    )
                                    .selectedLanguage(index);
                              },
                            ),
                          ),
                          if (languages[index].isSelected) ...[
                            SizedBox(height: 10.h),
                            Text(
                              "Languages Preferences",
                              style: textTheme.bodyMedium,
                            ),
                          ],
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
