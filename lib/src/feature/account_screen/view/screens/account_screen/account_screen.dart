import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common_widget_style/common_widgets/spacer/auto_spacer.dart';
import '../../widget/account_header.dart';
import '../../widget/account_section.dart';
import '../../widget_list/widget_list.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AccountHeader(textTheme: textTheme),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSpacer(space: 24.h),

                  ///Every Part of Account screen's manu Widget name "AccountSection"
                  AccountSection(
                    textTheme: textTheme,
                    title: 'Manage Accounts',
                    ///List of widget for all section
                    widgetList: AccountWidgetList.manageAccount(context),
                  ),
                  AccountSection(
                    textTheme: textTheme,
                    title: 'Posse',
                    widgetList: AccountWidgetList.posse(context),
                  ),
                  AccountSection(
                    textTheme: textTheme,
                    title: 'Support & Help',
                    widgetList: AccountWidgetList.helpSupport(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

