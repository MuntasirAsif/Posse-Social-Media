import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/feature/group_polls_screens/view/widgets/GroupPollsCardContent.dart';
import 'package:possy_app/src/feature/group_polls_screens/view/widgets/timeline_label.dart';


Widget historyContent({required BuildContext context}){
  // final headlineSmall = Theme.of(context).textTheme.headlineSmall;
  // final bodySmall = Theme.of(context).textTheme.bodySmall;

  return Column(
    children: [
      SizedBox(height: 44.h,),
      timelineLabel(context: context, label: "yesterday"),
      groupPollsCardContent(context: context,isInHistory: true,),

    ],
  );
}
