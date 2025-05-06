import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/feature/timeline_screen/timeline_parent_screen/view_model/timeline_screen_provider.dart';

import '../../../../../../common_widget_style/common_style/timeline_style/timeline_color.dart';
import '../../../../report_options.dart';

class ReportBottomSheetBody extends StatelessWidget{
  const ReportBottomSheetBody({super.key});


  @override
  Widget build(BuildContext context) {

    TextStyle? optionTextStyle = Theme.of(context).textTheme.titleSmall?.copyWith(color: TimelineColor.textColor);


    return Consumer(
        builder: (_, ref, _){
       //   final editState = ref.read(timelineProvider.notifier);
          final watchState = ref.watch(timelineProvider);
          return Column(
            children: [
                Column(
                  children: [
                    RadioListTile(
                      title: Text("Inappropriate photo",style: optionTextStyle,),
                      value:  ReportOptions.inappropriate,
                      groupValue: watchState.reportOption,
                      onChanged: (ReportOptions? value){
                        debugPrint("\nselected to inappropriate\n");
                        if(value != null){
                          ref.read(timelineProvider.notifier).onReportOptionSelect(value);
                        }
                      },
                      activeColor: TimelineColor.primaryColor,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                    RadioListTile(
                      title: Text("Offensive/rude nickname",style: optionTextStyle,),
                      value:  ReportOptions.offensive,
                      groupValue: watchState.reportOption,
                      onChanged: (ReportOptions? value){
                        if(value != null){
                          ref.read(timelineProvider.notifier).onReportOptionSelect(value);
                        }
                      },
                      activeColor: TimelineColor.primaryColor,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                    RadioListTile(
                      title: Text("Other",style: optionTextStyle,),
                      value:  ReportOptions.other,
                      groupValue: watchState.reportOption,
                      onChanged: (ReportOptions? value){
                        if(value != null){
                          ref.read(timelineProvider.notifier).onReportOptionSelect(value);
                        }
                      },
                      activeColor: TimelineColor.primaryColor,

                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                  ],
                ),

              if(watchState.reportOption == ReportOptions.other)
                Column(
                  children: [
                    SizedBox(height: 25.h,),
                    TextFormField(
                      maxLines: 3,
                      style: Theme.of(context).textTheme.bodyLarge,
                      decoration: InputDecoration(
                        hintText: "Enter your reason",
                        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color:Color(0xffDFE1E7) ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffDFE1E7),),
                            borderRadius: BorderRadius.circular(24.r)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffDFE1E7),),
                            borderRadius: BorderRadius.circular(24.r)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffDFE1E7),),

                            borderRadius: BorderRadius.circular(24.r)),
                      ),
                    )
                  ],
                )
            ],
          );
        });
  }
}