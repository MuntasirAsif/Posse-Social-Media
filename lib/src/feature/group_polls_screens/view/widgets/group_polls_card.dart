import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:possy_app/src/feature/group_polls_screens/view/widgets/GroupPollsCardContent.dart';

Widget groupPollsCard ({required BuildContext context}){

  return Container(
    // padding: EdgeInsets.only(bottom: 24.h,),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r)
    ),
    child: groupPollsCardContent(context: context,),
  );
}



