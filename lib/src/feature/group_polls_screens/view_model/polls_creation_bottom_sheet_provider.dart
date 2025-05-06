import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/src/feature/group_polls_screens/model/polls_creation_bottom_sheet_model.dart';

class PollsCreationBottomSheetProvider extends StateNotifier<PollsCreationBottomSheetModel> {
  PollsCreationBottomSheetProvider() : super(const PollsCreationBottomSheetModel());

  void updatePollQuestion(String text) {
    state = state.copyWith(pollQuestion: state.pollQuestion == "" ? text : text);
  }

  void addOption(String text) {
    if (text.isNotEmpty) {
      state = state.copyWith(options: [...state.options, text]);
    }
  }

  void removeOption(int index) {
    state = state.copyWith(options: List.from(state.options)..removeAt(index));
  }

  void clearOptions() {
    state = state.copyWith(options: []);
  }

  void onTapCreatePoll({required BuildContext context}){
    if(state.options.length >= 2 && state.options.length <= 4){
      Navigator.pop(context);
    }else{
      // Navigator.pop(context);
    }
  }

  /// Poll Counter

void incrementPollCounter(int index) {
    if(index == 0){
      state = state.copyWith(pollCounter1: state.pollCounter1 + 1);
      debugPrint("\noption 1: total vote ${state.pollCounter1}\n");
    }else if(index == 1){
      state = state.copyWith(pollCounter2: state.pollCounter2 + 1);
      debugPrint("\noption 2: total vote ${state.pollCounter2}\n");
    }else if(index == 2){
      state = state.copyWith(pollCounter3: state.pollCounter3 + 1);
      debugPrint("\noption 3: total vote ${state.pollCounter3}\n");
    }else if(index == 3){
      state = state.copyWith(pollCounter4: state.pollCounter4 + 1);
      debugPrint("\noption 4: total vote ${state.pollCounter4}\n");
    }
    state = state.copyWith(totalPollCounter: state.totalPollCounter + 1);
    debugPrint("\ntotal polls:  ${state.totalPollCounter}\n");
}

 /// Poll Percentage Counter
 //  double countPollParcentage(int index) {
 //    if (state.totalPollCounter == 0) {
 //      debugPrint("No votes yet.");
 //      return 0.0;
 //    }
 //
 //    // double percentage = 0.0;
 //
 //    if (index == 0) {
 //      state = state.copyWith(pollPercentage1: (state.pollCounter1 / state.totalPollCounter) * 100);
 //      debugPrint("Option 1 Percentage: ${state.pollPercentage1.toStringAsFixed(2)}%");
 //      return state.pollPercentage1;
 //    } else if (index == 1) {
 //      state = state.copyWith(pollPercentage2: (state.pollCounter2 / state.totalPollCounter) * 100);
 //      debugPrint("Option 2 Percentage: ${state.pollPercentage2.toStringAsFixed(2)}%");
 //      return state.pollPercentage2;
 //    } else if (index == 2) {
 //      state = state.copyWith(pollPercentage3: (state.pollCounter3 / state.totalPollCounter) * 100);
 //      debugPrint("Option 3 Percentage: ${state.pollPercentage3.toStringAsFixed(2)}%");
 //      return state.pollPercentage3;
 //    } else if (index == 3) {
 //      state = state.copyWith(pollPercentage4: (state.pollCounter4 / state.totalPollCounter) * 100);
 //      debugPrint("Option 4 Percentage: ${state.pollPercentage4.toStringAsFixed(2)}%");
 //      return state.pollPercentage4;
 //    } else {
 //      debugPrint("Invalid option index.");
 //      return 0.0;
 //    }
 //  }

}



final pollsCreationBottomSheetProvider = StateNotifierProvider<PollsCreationBottomSheetProvider, PollsCreationBottomSheetModel>(
        (ref) => PollsCreationBottomSheetProvider()
);
