class NotificationSettingModel {
  final String notificationType;
  final bool isSelected;

  NotificationSettingModel({
    required this.notificationType,
    required this.isSelected,
  });

  NotificationSettingModel copyWith({
    String? notificationTitle,
    String? notificationDescription,
    String? notificationType,
    bool? isSelected,
  }) {
    return NotificationSettingModel(
      notificationType: notificationType ?? this.notificationType,
        isSelected: isSelected ?? this.isSelected,
    );
  }
}
