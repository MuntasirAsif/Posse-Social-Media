import 'package:possy_app/src/model/possy_users_model.dart';

class QuizModel {
  List<QuizList>? quizList;

  QuizModel({this.quizList});

  QuizModel copyWith({List<QuizList>? quizList}) {
    return QuizModel(
      quizList: quizList ?? this.quizList,
    );
  }

  QuizModel.fromJson(Map<String, dynamic> json) {
    if (json['quizList'] != null) {
      quizList = <QuizList>[];
      json['quizList'].forEach((v) {
        quizList!.add(QuizList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (quizList != null) {
      data['quizList'] = quizList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuizList {
  String? question;
  List<OptionModel>? options;

  QuizList({this.question, this.options});

  QuizList copyWith({String? question, List<OptionModel>? options}) {
    return QuizList(
      question: question ?? this.question,
      options: options ?? this.options,
    );
  }

  QuizList.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    if (json['options'] != null) {
      options = <OptionModel>[];
      json['options'].forEach((v) {
        options!.add(OptionModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['question'] = question;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OptionModel {
  String? option;
  List<UserModel>? users;

  OptionModel({this.option, this.users});

  OptionModel copyWith({String? option, List<UserModel>? users}) {
    return OptionModel(
      option: option ?? this.option,
      users: users ?? this.users,
    );
  }

  OptionModel.fromJson(Map<String, dynamic> json) {
    option = json['option'];
    if (json['users'] != null) {
      users = <UserModel>[];
      json['users'].forEach((v) {
        users!.add(UserModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['option'] = option;
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class Users {
//   String? userId;
//   String? userName;
//   String? profilePicture;
//
//   Users({this.userId, this.userName, this.profilePicture});
//
//   Users copyWith({String? userId, String? userName, String? profilePicture}) {
//     return Users(
//       userId: userId ?? this.userId,
//       userName: userName ?? this.userName,
//       profilePicture: profilePicture ?? this.profilePicture,
//     );
//   }
//
//   Users.fromJson(Map<String, dynamic> json) {
//     userId = json['userId'];
//     userName = json['userName'];
//     profilePicture = json['profilePicture'];
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'userId': userId,
//       'userName': userName,
//       'profilePicture': profilePicture,
//     };
//   }
// }
