import 'package:possy_app/src/model/user_post_model.dart';

class UserProfileModel {
  String? userName;
  String? fullName;
  String? profilePicture;
  List<Posts>? posts;

  UserProfileModel(
      {this.userName, this.fullName, this.profilePicture, this.posts});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    fullName = json['fullName'];
    profilePicture = json['profilePicture'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['fullName'] = this.fullName;
    data['profilePicture'] = this.profilePicture;
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class Posts {
//   String? userName;
//   String? userID;
//   String? postDate;
//   String? profilePicture;
//   String? caption;
//   String? imagePath;
//   int? reacts;
//   int? comments;
//
//   Posts(
//       {this.userName,
//         this.userID,
//         this.postDate,
//         this.profilePicture,
//         this.caption,
//         this.imagePath,
//         this.reacts,
//         this.comments});
//
//   Posts.fromJson(Map<String, dynamic> json) {
//     userName = json['userName'];
//     userID = json['userID'];
//     postDate = json['postDate'];
//     profilePicture = json['profilePicture'];
//     caption = json['caption'];
//     imagePath = json['imagePath'];
//     reacts = json['reacts'];
//     comments = json['comments'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['userName'] = this.userName;
//     data['userID'] = this.userID;
//     data['postDate'] = this.postDate;
//     data['profilePicture'] = this.profilePicture;
//     data['caption'] = this.caption;
//     data['imagePath'] = this.imagePath;
//     data['reacts'] = this.reacts;
//     data['comments'] = this.comments;
//     return data;
//   }
// }
