import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/src/feature/group_polls_screens/view/group_polls_screen.dart';
import 'package:possy_app/src/feature/home_screen/view/view/home_screen.dart';
import 'package:possy_app/src/feature/quiz_screen/view/view/quiz_Screen.dart';
import 'package:possy_app/src/feature/vibe_check_screen/vibe_check_screen.dart';
import '../../timeline_screen/timeline_parent_screen/view/timeline_screen.dart';
import '../riverpod_model/parent_screen_riverpod_model.dart';

class ParentsScreenProvider extends StateNotifier<ParentScreenRiverPodModel>{

  ParentsScreenProvider() : super(ParentScreenRiverPodModel());

  /// variable name
  final List<Widget> _pageList = const [
    QuizScreen(),
    TimelineScreen(),
    HomeScreen(),
    VibeCheckScreen(),
    GroupPollsScreen(),
  ];

  /// variable name
  List<Widget> get pageList => _pageList;



  void onSelectedIndex(int index) {

    debugPrint("\nSelected Page index : $index\n");
    state = state.copyWith(selectedIndex: index);
  }
}

final parentsScreenProvider = StateNotifierProvider<ParentsScreenProvider, ParentScreenRiverPodModel>(
        (ref) {
  return ParentsScreenProvider();
});


