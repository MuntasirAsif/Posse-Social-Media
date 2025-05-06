class PossyUsersModel {
  List<UserModel>? users;

  PossyUsersModel({this.users});

  PossyUsersModel.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <UserModel>[];
      json['users'].forEach((v) {
        users!.add(new UserModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserModel {
  String? userId;
  String? userName;
  String? profilePicture;

  UserModel({this.userId, this.userName, this.profilePicture});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    profilePicture = json['profilePicture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['profilePicture'] = this.profilePicture;
    return data;
  }
}