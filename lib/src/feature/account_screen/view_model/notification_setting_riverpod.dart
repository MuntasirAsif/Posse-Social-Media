import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/src/feature/account_screen/data/notification_setting_data.dart';
import 'package:possy_app/src/feature/account_screen/model/notification_setting_model.dart';

class NotificationSettingsNotifier
    extends StateNotifier<List<NotificationSettingModel>> {
  NotificationSettingsNotifier(super.initialNotification);

  void notificationSettingsToggle(int index) {
    state[index] = state[index].copyWith(isSelected: !state[index].isSelected);
    state = [...state];
  }
}

final notificationSettingsProvider =
    StateNotifierProvider<NotificationSettingsNotifier, List<NotificationSettingModel>>(
      (ref) {
        return NotificationSettingsNotifier(notificationSettingData);
      },
    );
