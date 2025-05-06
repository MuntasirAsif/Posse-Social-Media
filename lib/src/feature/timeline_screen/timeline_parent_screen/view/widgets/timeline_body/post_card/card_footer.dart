import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../common_widget_style/common_style/timeline_style/timeline_color.dart';

class CardFooter extends StatelessWidget{
  final int reactAmount;
  final int commentAmount;
  const CardFooter({
    super.key,
    required this.reactAmount,
    required this.commentAmount,
  });


  /// Secondary Button
  Widget secondaryButton({required bool isCircle, required Widget child, required Function onTap}) {
    return GestureDetector(
      onTap: () {
        debugPrint("\nTaped on post menu.\n");
        onTap();
      },
      child: Container(
        //width: 28.w,
        // height: 28.w,
        decoration: BoxDecoration(
          color: TimelineColor.secondaryColor,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isCircle ? BorderRadius.circular(1000) : BorderRadius.circular(24.r)
          ,
          border: Border.all(color: Color(0xffECEFF3)),
        ),
        child: child,
        // Icon(Icons.menu,color: Color(0xff4A4C56),size: 15.r,),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 16.w,
      children: [
        secondaryButton(
          onTap: (){},
            isCircle: false,
            child: Padding(
              padding: EdgeInsets.all(4.r ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 4.w,
                children: [
                  Icon(Icons.heart_broken_outlined,size: 16.r,
                    color: TimelineColor.onSecondaryColor,),

                  Text(reactAmount.toString(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: TimelineColor.onSecondaryColor,
                    ),)
                ],
              ),
            )
        ),

        secondaryButton(
          onTap: (){},
            isCircle: false,
            child: Padding(
              padding: EdgeInsets.all(4.r ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 4.w,
                children: [
                  Icon(Icons.mode_comment_outlined,
                    size: 16.r,
                    color: TimelineColor.onSecondaryColor,),

                  Text(commentAmount.toString(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: TimelineColor.onSecondaryColor,
                        fontWeight: FontWeight.w600
                    ),)
                ],
              ),
            )
        ),
      ],
    );
  }
}