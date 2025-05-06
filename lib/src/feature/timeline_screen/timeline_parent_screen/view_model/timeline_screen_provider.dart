import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/src/feature/timeline_screen/report_options.dart';
import 'package:possy_app/src/model/user_post_model.dart';
import '../../../../../core/constant/icons.dart';
import '../../../../common_widget_style/common_style/timeline_style/timeline_color.dart';
import '../../../../common_widget_style/common_widgets/common_widgets.dart';
import '../riverpod_model/timeline_screen_model.dart';

final timelineProvider = StateNotifierProvider<TimelineProvider, TimelineScreenModel>(
      (ref) => TimelineProvider(),
    );

class TimelineProvider extends StateNotifier<TimelineScreenModel>  {
  TimelineProvider() : super(TimelineScreenModel()) {
    fetchUsersPost();
  }

  TextEditingController searchController = TextEditingController();

  /// dummy post
  final Map<String, dynamic> dummyUsersPost = const {
    "posts": [
      {
        "userName": "marilyn.torff",
        "userID":"123abc",
        "postDate": "March 02, 2025",
        "profilePicture": AppImages.male2,
        "caption": "Just living life one sunset at a time. 🌅✨",
        "imagePath": AppImages.birthday,
        "reacts": 1450,
        "comments": 20,
      },
      {
        "userName": "lindsey.septimus",
        "userID":"123abcd",
        "postDate": "2m ago",
        "profilePicture": AppImages.femaleProfilePicture,
        "caption": "Happiness is a perfectly cooked meal. 🍽️😋",
        "imagePath": null,
        "reacts": 1450,
        "comments": 20,
      },
      {
        "userName": "marilyn.torff",
        "userID":"123abc",
        "postDate": "March 11, 2025",
        "profilePicture": AppImages.male2,
        "caption":
            "Dream big, work hard, stay focused, and surround yourself with good energy. 💪",
        "imagePath": AppImages.hillTracking,
        "reacts": 210,
        "comments": 42,
      },
      {
        "userName": "lindsey.septimus",
        "userID":"123abcd",
        "postDate": "2m ago",
        "profilePicture": AppImages.femaleProfilePicture,
        "caption": "Happiness is a perfectly cooked meal. 🍽️😋",
        "imagePath": null,
        "reacts": 1450,
        "comments": 20,
      },
    ],
  };

  /// Fetch User post
  Future<void> fetchUsersPost() async {
    try {
      debugPrint("\nFetching users data.\n");
      PossyModel? userPostModel = PossyModel.fromJson(dummyUsersPost);
      state = state.copyWith(userPostModel: userPostModel);
      state = state.copyWith(filteredUserPostModel: state.userPostModel!.posts);
    } catch (error) {
      debugPrint("\nError while fetch user post : $error\n");
    }
  }

  /// searching post
  void onSearch(String searchCommand) {
    try {
      debugPrint("\nSearching posts");
      if (searchCommand.isNotEmpty &&
          (state.userPostModel!.posts != null ||
              state.userPostModel!.posts!.isNotEmpty)) {
        state = state.copyWith(
          filteredUserPostModel:
                state.userPostModel!.posts!
                    .where((post) => post.userName!.toLowerCase().contains(searchCommand) || post.caption!.toLowerCase().contains(searchCommand)).toList(),

        );
      }
      else if(searchCommand.isEmpty){
        state = state.copyWith(filteredUserPostModel: state.userPostModel!.posts);
      }
    } catch (error) {
      debugPrint("\nError while searching post : $error\n");
    }
  }

  /// report user section

  /// report bottom sheet
  Future<void> reportBottomSheet({
    required BuildContext context,
    required Widget bodyWidget,

  }) async {
    bool isConfirm =  await CommonWidgets.customConfirmationBottomSheet(
      context: context,
      confirmButtonText: "Report",
      iconPath: AppIcons.snooze,
      bodyText: "Do you want to snooze this user for 7 days?",
      onConfirm: () async {
        Navigator.pop(context);
      },
    );
    debugPrint("\nIs 1st step confirm : ${isConfirm.toString()}\n");
    state = state.copyWith(reportOption: null);
    debugPrint("\nreport option after pressing report : ${state.reportOption}\n");
    if(isConfirm){
      isConfirm =  await CommonWidgets.customConfirmationBottomSheet(
          maxBottomSheetHeight:  450.h,
          context: context,
          confirmButtonText: "Report",
          onConfirm: (){
            if(state.reportOption != null){
              Navigator.pop(context);
            }

          },
          bodyWidget: bodyWidget
      );

      if(isConfirm){
        onReport();
      }
    }
  }


  void onReportOptionSelect(ReportOptions reportOption){
    debugPrint("\nreport as ${reportOption.toString()}\n");
    state = state.copyWith(reportOption: reportOption);
  }

  void onReport(){
    debugPrint("\nPossy reported successfully!\n");
    state = state.copyWith(reportOption: null);
  }
}
