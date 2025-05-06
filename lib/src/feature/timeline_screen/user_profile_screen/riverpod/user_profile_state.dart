import '../../../../model/userProfileModel.dart';

class UserProfileState{
  UserProfileModel? userProfileModel;
  int profileBodyIndex;
  UserProfileState({this.userProfileModel, this.profileBodyIndex = 0});
  UserProfileState copyWith({UserProfileModel? userProfileModel, int? profileBodyIndex}){
    return UserProfileState(
      userProfileModel: userProfileModel ?? this.userProfileModel,
      profileBodyIndex: profileBodyIndex ?? this.profileBodyIndex,
    );
  }
}