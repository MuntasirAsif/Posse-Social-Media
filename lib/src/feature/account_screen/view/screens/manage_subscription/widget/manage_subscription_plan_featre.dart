import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:possy_app/src/common_widget_style/common_style/account_style/account_color.dart';

class ManageSubscriptionPlanFeature extends StatelessWidget {
  const ManageSubscriptionPlanFeature({
    super.key,
    required this.leadingImage,
    required this.title,
    required this.subtitle,
  });
  final String leadingImage;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ListTile(
      titleAlignment: ListTileTitleAlignment.titleHeight,
      leading: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AccountColor.manageAccountBg,
        ),
        child: SvgPicture.asset(leadingImage),
      ),
      title: Text(
        title,
        style: textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        subtitle,
        style: textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w500,
          color: AccountColor.textSubColor,
        ),
      ),
    );
  }
}
