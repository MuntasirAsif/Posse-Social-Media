import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../../../common_widget_style/common_style/account_style/account_color.dart';
import '../../../../../../common_widget_style/common_widgets/spacer/auto_spacer.dart';

class PremiumPlanCard extends StatelessWidget {
  const PremiumPlanCard({
    super.key,
    required this.textTheme,
    required this.isPopular,
    required this.isSelected,
    required this.onChanged,
    required this.title,
    required this.price,
    required this.pricePerMonth,
  });

  final TextTheme textTheme;
  final bool isPopular;
  final bool isSelected;
  final VoidCallback onChanged;
  final String title;
  final double price;
  final String pricePerMonth;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: AccountColor.geryCycle,
                  borderRadius: BorderRadius.circular(16.r),
                  border:
                      isSelected
                          ? Border.all(color: AppColor.primaryColor, width: 2)
                          : null,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title, style: textTheme.titleMedium),
                            AutoSpacer(space: 10.h),
                            Row(
                              children: [
                                Text(
                                  '\$$price',
                                  style: textTheme.bodyMedium!.copyWith(
                                    color:
                                        isSelected
                                            ? Color(0xffF63D4D)
                                            : Colors.black,
                                  ),
                                ),
                                AutoSpacer(space: 16.h),
                                Text(
                                  '\$$pricePerMonth/month',
                                  style: textTheme.bodyMedium!.copyWith(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Radio(
                          value: isSelected,
                          groupValue: true,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          isPopular
              ? Positioned(
                right: 21.w,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 2.h,
                  ),
                  decoration: BoxDecoration(
                    color: AccountColor.red,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Text('POPULAR'),
                ),
              )
              : SizedBox(),
        ],
      ),
    );
  }
}
