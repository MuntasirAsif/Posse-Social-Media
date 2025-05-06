import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';

import '../../../../../../../core/constant/icons.dart';
import '../../../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../common_widget_style/common_style/account_style/account_color.dart';
import '../../../../../../common_widget_style/common_widgets/spacer/auto_spacer.dart';

class PaymentInformationCard extends StatelessWidget {
  const PaymentInformationCard({
    super.key,
    required this.textTheme,
    required this.cardNumber,
    required this.nextBillingDate,
  });

  final TextTheme textTheme;
  final String cardNumber;
  final String nextBillingDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.visaCardLogo),
                        AutoSpacer(space: 16.w),
                        Text(
                          Utils.maskCardNumber(cardNumber),
                          style: textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    AutoSpacer(space: 12.w),
                    Text(
                      'Next Billing Date: $nextBillingDate',
                      style: textTheme.bodyMedium!.copyWith(
                        color: AccountColor.textSubColor,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    AppColor.primaryColor,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Change',
                  style: textTheme.bodyMedium!.copyWith(color: AppColor.white),
                ),
              ),
            ],
          ),
        ),
        AutoSpacer(space: 16.h),
        Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(12.r),
            titleAlignment: ListTileTitleAlignment.titleHeight,
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: AccountColor.manageAccountBg,
              child: SvgPicture.asset(AppIcons.creditCard),
            ),
            title: Text('Debit Card'),
            subtitle: Text('Not added'),
            trailing: SizedBox(
              width: 100,
              child: CommonWidgets.primaryButton(
                context: context,
                title: 'add',
                color: AppColor.primaryColor,
                textColor: AppColor.white,
                onPressed: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
