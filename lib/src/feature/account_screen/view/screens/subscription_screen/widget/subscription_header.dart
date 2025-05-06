import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../core/constant/icons.dart';
import '../../../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../../../common_widget_style/common_style/account_style/account_color.dart';
import '../../../../../../common_widget_style/common_widgets/common_header.dart';
import '../../../../../../common_widget_style/common_widgets/common_widgets.dart';

class SubscriptionHeader extends StatelessWidget {
  const SubscriptionHeader({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return CommonHeader(
      backgroundColor: AccountColor.backgroundColor,
      backgroundContainerHeight: 112.h,
      child: CommonWidgets.customAppBar(
        context: context,
        title: 'Subscription',
        titleColor: AppColor.white,
        isBackButton: true,
        actionWidgets: SvgPicture.asset(AppIcons.premiumCard),
      ),
    );
  }
}
