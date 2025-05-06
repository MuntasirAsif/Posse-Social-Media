// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DayContainer extends StatelessWidget {
  final String text;
  void Function()? onTap;
 DayContainer({super.key,
  required this.text,
  required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: onTap,
      child: Container(   
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Color(0xffE7EEDD),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 6.w, right: 6.w),
          child: Text(text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            decorationColor: Colors.grey
          ),
          ),
        ),
      ),
    );
  }
}