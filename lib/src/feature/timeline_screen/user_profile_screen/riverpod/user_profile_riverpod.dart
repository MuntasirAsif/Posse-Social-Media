import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/src/feature/timeline_screen/user_profile_screen/riverpod/user_profile_state.dart';
import 'package:possy_app/src/model/userProfileModel.dart';
import '../../../../../core/constant/images.dart';

final userProfileRiverpod = StateNotifierProvider<UserProfileRiverpod, UserProfileState>(
      (ref) => UserProfileRiverpod(),
);


class UserProfileRiverpod extends StateNotifier<UserProfileState>{

  /// constructo
  UserProfileRiverpod() : super(UserProfileState()) {
    /// fetch user data
    fetchUserProfileModel();
  }


  final tabs = [
    {'label': 'Posts', 'iconPath': AppIcons.newsfeed},
    {'label': 'Media', 'iconPath': AppIcons.photo},
  ];

  void switchTab({required int index}){
    state = state.copyWith(profileBodyIndex: index);
  }

  /// dummy user data
  final Map<String, dynamic> dummyUserProfileData = {
    "userName": "",
    "fullName": "",
    "profilePicture": "",
    "posts": [
      {
        "userName": "marilyn.torff",
        "userID": "123abc",
        "postDate": "March 02, 2025",
        "profilePicture": AppImages.male2,
        "caption": "Just living life one sunset at a time. 🌅✨",
        "imagePath": AppImages.birthday,
        "reacts": 1450,
        "comments": 20
      },
      {
        "userName": "marilyn.torff",
        "userID": "123abc",
        "postDate": "March 05, 2025",
        "profilePicture": AppImages.male2,
        "caption": "Chasing dreams and golden skies.",
        "imagePath": AppImages.birthday,
        "reacts": 1280,
        "comments": 18
      },
      {
        "userName": "marilyn.torff",
        "userID": "123abc",
        "postDate": "March 07, 2025",
        "profilePicture": AppImages.male2,
        "caption": "Peaceful moments are everything.",
        "imagePath": AppImages.birthday,
        "reacts": 1325,
        "comments": 25
      },
      {
        "userName": "marilyn.torff",
        "userID": "123abc",
        "postDate": "March 10, 2025",
        "profilePicture": AppImages.male2,
        "caption": "Grateful for the little things. 🙏",
        "imagePath": AppImages.birthday,
        "reacts": 1580,
        "comments": 30
      },
      {
        "userName": "marilyn.torff",
        "userID": "123abc",
        "postDate": "March 12, 2025",
        "profilePicture": AppImages.male2,
        "caption": "Stillness speaks louder than noise.",
        "imagePath": AppImages.birthday,
        "reacts": 980,
        "comments": 10
      },
      {
        "userName": "marilyn.torff",
        "userID": "123abc",
        "postDate": "March 14, 2025",
        "profilePicture": AppImages.male2,
        "caption": "Even the ordinary days feel magical.",
        "imagePath": AppImages.birthday,
        "reacts": 1110,
        "comments": 15
      },
      {
        "userName": "marilyn.torff",
        "userID": "123abc",
        "postDate": "March 17, 2025",
        "profilePicture": AppImages.male2,
        "caption": "A little light and a lot of love. 💫",
        "imagePath": AppImages.birthday,
        "reacts": 1695,
        "comments": 22
      },
      {
        "userName": "marilyn.torff",
        "userID": "123abc",
        "postDate": "March 19, 2025",
        "profilePicture": AppImages.male2,
        "caption": "Sunshine is the best filter.",
        "imagePath": AppImages.birthday,
        "reacts": 1340,
        "comments": 12
      },
      {
        "userName": "marilyn.torff",
        "userID": "123abc",
        "postDate": "March 21, 2025",
        "profilePicture": AppImages.male2,
        "caption": "Wander often, wonder always.",
        "imagePath": AppImages.birthday,
        "reacts": 1205,
        "comments": 14
      },
      {
        "userName": "marilyn.torff",
        "userID": "123abc",
        "postDate": "March 24, 2025",
        "profilePicture": AppImages.male2,
        "caption": "Moments like this are forever. 🕊️",
        "imagePath": AppImages.birthday,
        "reacts": 1410,
        "comments": 17
      }
    ]
  };

  /// fetch user data
  Future<void> fetchUserProfileModel() async {
    UserProfileModel? userProfileModel = UserProfileModel.fromJson(dummyUserProfileData);
    state = state.copyWith(userProfileModel: userProfileModel);

  }

}