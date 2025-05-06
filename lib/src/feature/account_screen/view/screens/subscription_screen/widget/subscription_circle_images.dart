import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SubscriptionCircleImages extends StatelessWidget {
  const SubscriptionCircleImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> imageList = List.generate(
      20,
          (i) => 'https://randomuser.me/api/portraits/men/${i + 1}.jpg',
    );
    return Container(
      height: 80.h,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: ClipOval(
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                imageList[index],
                width: 80.w,
                height: 80.w,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
