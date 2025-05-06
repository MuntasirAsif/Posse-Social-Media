import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/theme/src/theme_extension/color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_style/group_polls_style/group_polls_color_palette.dart';
import 'package:possy_app/src/feature/group_polls_screens/view_model/polls_creation_bottom_sheet_provider.dart';

class PollsCreationBottomSheetInputContent extends StatefulWidget {
   const PollsCreationBottomSheetInputContent({
    super.key,
  });

  @override
  State<PollsCreationBottomSheetInputContent> createState() => _PollsCreationBottomSheetInputContentState();
}

class _PollsCreationBottomSheetInputContentState extends State<PollsCreationBottomSheetInputContent> {

  final TextEditingController _optionController = TextEditingController();
  final TextEditingController _questionController = TextEditingController();
  final FocusNode _optionFocusNode = FocusNode();
  final FocusNode _questionFocusNode = FocusNode();
  final FocusNode _keyboardFocus = FocusNode();
  final FocusNode _nextFieldFocus = FocusNode();

  @override
  void dispose() {
    _optionController.dispose();
    _questionController.dispose();
    _optionFocusNode.dispose();
    _keyboardFocus.dispose();
    _nextFieldFocus.dispose();
    _questionFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final titleSmall = Theme.of(context).textTheme.titleSmall;
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;

    return Consumer(
      builder: (context, ref, child) {
        final notifier = ref.read(pollsCreationBottomSheetProvider.notifier);
        final _options = ref.watch(pollsCreationBottomSheetProvider).options;
        final _question = ref.watch(pollsCreationBottomSheetProvider).pollQuestion;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 38.h),
            Text(
              "Question", style: bodyLarge?.copyWith(
                color: GroupPollsColorPalette.grayBlack500,
                fontWeight: FontWeight.w500,),),
            SizedBox(height: 18.h),
            TextField(
              controller: _questionController,
              focusNode: _questionFocusNode,
              maxLines: 1,
              textInputAction: TextInputAction.next,
              onChanged: (value){
                notifier.updatePollQuestion(value);
              },
              onTap: () {
                FocusScope.of(context).requestFocus(_nextFieldFocus);
                debugPrint("\n\nQuestion saved: $_question");
              },
              decoration: InputDecoration(
                hintText: "What's your poll about?",
                hintStyle: titleSmall?.copyWith(
                  color: GroupPollsColorPalette.greyScale500,),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero, // Optional: tight padding
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              "Options", style: bodyLarge?.copyWith(
                color: GroupPollsColorPalette.grayBlack500,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.h),
            ...List.generate(_options.length, ((index) {
              return _options.isEmpty ? SizedBox() : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _options[index], style: bodyLarge?.copyWith(
                              color: AppColor.primaryTextColor,
                              fontWeight: FontWeight.w600,),
                          ),
                          IconButton(
                            onPressed: () {
                              notifier.removeOption(index);
                              debugPrint('\n\n onTap Delete Icon: item deleted\n\n',);
                            },
                            icon: Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                      Divider(color: GroupPollsColorPalette.borderColor),
                    ],
                  );
            })),
            SizedBox(height: 18.h),
            TextField(
              controller: _optionController,
              readOnly: _options.length >= 4 ? true : false,
              focusNode: _optionFocusNode,
              textInputAction: TextInputAction.done,
              onTap: () => _keyboardFocus.requestFocus(),
              onEditingComplete: () {
                notifier.addOption(_optionController.text);
                _optionController.clear();
                FocusScope.of(context).requestFocus(_optionFocusNode);
              },
              decoration: InputDecoration(
                hintText: _options.length >= 4 ? "Can not add more than 4 options" : "Type and press Enter to add option",
                hintStyle: titleSmall?.copyWith(
                  color: GroupPollsColorPalette.greyScale500,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
            SizedBox(height: 44.h),
          ],
        );
      },
    );
  }
}
