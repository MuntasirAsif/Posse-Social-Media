class NotificationModel {
  final String notificationId;
  final DateTime dateTime;
  final String title;
  final String description;
  final String notificationType;
  final bool isRead;

  NotificationModel({
    required this.notificationId,
    required this.dateTime,
    required this.title,
    required this.description,
    required this.isRead,
    required this.notificationType,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      notificationId: json['notificationId'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      title: json['title'] as String,
      description: json['description'] as String,
      isRead: json['isRead'] as bool,
      notificationType: json['notificationType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'notificationId': notificationId,
      'dateTime': dateTime.toIso8601String(),
      'title': title,
      'description': description,
      'isRead': isRead,
      'notificationType': notificationType,
    };
  }
}
