import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class BuildFeature extends StatelessWidget {
  const BuildFeature({
    super.key, required this.image, required this.title,
  });
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        SvgPicture.asset(image),
        Text(title)
      ],
    );
  }
}