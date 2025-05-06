import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../common_widget_style/common_style/timeline_style/timeline_color.dart';

class CircleProfile extends StatelessWidget{

  final int index;
  final String name;
  final String? imagePath;
  final Color? color;

  const CircleProfile({super.key, required this.index, required this.name,  this.imagePath,  this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment : MainAxisAlignment.start,
          spacing: 4.h,
          children: [
            GestureDetector(
              onTap:(){},
              child:
              Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:  index == 0 ? Colors.white :  Color(0xffF5F5F5).withValues(alpha: 0.3),
                    width: 2
                  ),
                  color:  index == 0 ?  Color(0xff1A2310) : Colors.transparent
                ),
                child: index == 0 ? Icon(Icons.add,color: Colors.white,) : Image.asset(imagePath!,
                  width: 60.w,
                  height: 60.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Expanded(
              child: Text( name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: TimelineColor.onPrimaryColor,
                  fontWeight: FontWeight.w600
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        SizedBox(width: 5,)
      ],
    );
  }
}