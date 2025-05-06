import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/feature/account_screen/data/notification_setting_data.dart';

import '../../../../../../core/theme/src/theme_extension/color_pallete.dart';
import '../../../../../common_widget_style/common_style/account_style/account_color.dart';
import '../../../../../common_widget_style/common_widgets/common_header.dart';
import '../../../../../common_widget_style/common_widgets/common_widgets.dart';
import '../../../view_model/notification_setting_riverpod.dart';

class ManageNotification extends ConsumerWidget {
  const ManageNotification({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          CommonHeader(
            backgroundColor: AccountColor.backgroundColor,
            backgroundContainerHeight: 112.h,
            child: CommonWidgets.customAppBar(
              context: context,
              title: 'Manage Notifications',
              titleColor: AppColor.white,
              isBackButton: true,
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: notificationSettingData.length,
              itemBuilder: (BuildContext context, int index){
                final notificationSettings = ref.watch(notificationSettingsProvider);
            return ListTile(
              title: Text(notificationSettings[index].notificationType),
              trailing: Switch(
                activeTrackColor: AccountColor.activeTrackColor,
                value: notificationSettings[index].isSelected,
                onChanged: (value) {
                  ref.read(notificationSettingsProvider.notifier).notificationSettingsToggle(index);
                },
              ),
            );
          })
        ],
      ),
    );
  }
}
