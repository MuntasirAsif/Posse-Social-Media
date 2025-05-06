class User {
  final String userID;
  final String userName;
  final String profileImageUrl;
  final String email;
  final bool isSubscribed;
  String? planId;

  User({
    required this.userID,
    required this.userName,
    required this.profileImageUrl,
    required this.email,
    required this.isSubscribed,
    this.planId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: json['userID'] as String,
      userName: json['userName'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
      email: json['email'] as String,
      isSubscribed: json['isSubscribed'] as bool,
      planId: json['planId'] as String?, // nullable
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'userName': userName,
      'profileImageUrl': profileImageUrl,
      'email': email,
      'isSubscribed': isSubscribed,
      'planId': planId,
    };
  }
}
