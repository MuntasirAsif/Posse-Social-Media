import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/src/model/possy_users_model.dart';
import '../../../../model/grQuizModel.dart';
import '../Riverpod_Model/quizState.dart';


class QuizSelectionNotifier extends StateNotifier<QuizSelectionState> {
  QuizSelectionNotifier()
      : super(QuizSelectionState()){
    fetchQuiz();
  }

  final Map<String,dynamic> usersList = {
    "users": [
      {
        "userId": "1a",
        "userName": "Heisenberg",
        "profilePicture": "assets/images/a.png"
      },
      {
        "userId": "1b",
        "userName": "Brooklyn Simmons",
        "profilePicture": "assets/images/b.png"
      },
      {
        "userId": "1c",
        "userName": "Theresa Webb",
        "profilePicture": "assets/images/c.png"
      },
      {
        "userId": "1d",
        "userName": "Ronald Richards",
        "profilePicture": "assets/images/d.png"
      },
      {
        "userId": "1e",
        "userName": "Darrell Steward",
        "profilePicture": "assets/images/e.png"
      },
      {
        "userId": "1f",
        "userName": "Bessie Cooper",
        "profilePicture": "assets/images/f.png"
      },
      {
        "userId": "1g",
        "userName": "Robert Fox",
        "profilePicture": "assets/images/g.png"
      },
      {
        "userId": "1h",
        "userName": "Eleanor Pena",
        "profilePicture": "assets/images/h.png"
      },
      {
        "userId": "1i",
        "userName": "Arlene McCoy",
        "profilePicture": "assets/images/i.png"
      },
      {
        "userId": "1j",
        "userName": "Darlene Robertson",
        "profilePicture": "assets/images/j.png"
      },
      {
        "userId": "1k",
        "userName": "Kathryn Murphy",
        "profilePicture": "assets/images/k.png"
      },
      {
        "userId": "1l",
        "userName": "Devon Lane",
        "profilePicture": "assets/images/l.png"
      }
    ]
  };

  final Map<String, dynamic> quizDummyData = {
    "quizList": [
      {
        "question": "What flavor ice-cream would each member of your posse be?",
        "options": [
          {
            "option": "Midnight Mocha Crunch",
            "users": [
              {
                "userId": "1a",
                "userName": "Heisenberg",
                "profilePicture": "assets/images/a.png"
              },
              {
                "userId": "1b",
                "userName": "Brooklyn Simmons",
                "profilePicture": "assets/images/b.png"
              }
            ]
          },
          {
            "option": "Electric Blue Raspberry Swirl",
            "users": [
              {
                "userId": "1c",
                "userName": "Theresa Webb",
                "profilePicture": "assets/images/c.png"
              }
            ]
          },
          {
            "option": "Caramel Chaos",
            "users": []
          },
          {
            "option": "Honey Lavender Bliss",
            "users": [
              {
                "userId": "1d",
                "userName": "Ronald Richards",
                "profilePicture": "assets/images/d.png"
              },
              {
                "userId": "1e",
                "userName": "Darrell Steward",
                "profilePicture": "assets/images/e.png"
              }
            ]
          }
        ]
      },
      {
        "question": "Which city best represents your posse’s energy?",
        "options": [
          {
            "option": "New York",
            "users": []
          },
          {
            "option": "Tokyo",
            "users": [
              {
                "userId": "1f",
                "userName": "Bessie Cooper",
                "profilePicture": "assets/images/f.png"
              }
            ]
          },
          {
            "option": "Paris",
            "users": [
              {
                "userId": "1g",
                "userName": "Robert Fox",
                "profilePicture": "assets/images/g.png"
              },
              {
                "userId": "1h",
                "userName": "Eleanor Pena",
                "profilePicture": "assets/images/h.png"
              }
            ]
          },
          {
            "option": "Dhaka",
            "users": [
              {
                "userId": "1i",
                "userName": "Arlene McCoy",
                "profilePicture": "assets/images/i.png"
              }
            ]
          }
        ]
      }
    ]
  };


  late final List<bool> isOptionSelected;
  Future<void> fetchQuiz() async {
     try{
       QuizModel quizModel = QuizModel.fromJson(quizDummyData);

       /// length depend on option list
       isOptionSelected = List<bool>.filled(12, false);
       PossyUsersModel usersModel = PossyUsersModel.fromJson(usersList);
       state = state.copyWith(quizModel: quizModel, isOptionSelected:isOptionSelected,usersModel: usersModel);
       debugPrint("\nQuiz fetched Successfully\n");

     }catch(error){
       debugPrint("\nerror while fetching quiz : $error\n");
     }
   }

   /// check is selected or not
   bool checkIsSelected({required int questionIndex, required String selectedUserId}){

    return false;
   }


   bool searchSelectedUser({required int quizIndex, required int optionIndex, required String userId}){
     final userIndex = state.quizModel!.quizList![quizIndex].options![optionIndex].users!.indexWhere((user)=>user.userId == userId);
     if(userIndex != -1){
       return true;
     }
     else {
       return false;
     }
   }

  void toggle({required int quizIndex, required int optionIndex, required int userIndex, required UserModel user}) {
//    final userIndex = state.quizModel!.quizList![quizIndex].options![optionIndex].users!.indexWhere((user)=>user.userId == userId);
  //  final user = state.usersModel!.users!.where((user)=>user.userId == userId);
    String userId = user.userId!;
    List<UserModel> updatedList = [];
    if(userIndex != -1){
       updatedList = [...state.quizModel!.quizList![quizIndex].options![optionIndex].users!, user];
    }
    else{
      updatedList = state.quizModel!.quizList![quizIndex].options![optionIndex].users!.where((user)=>user.userId != userId).toList();
    }
    final currentSelectedList = state.isOptionSelected ?? [];
    final updatedSelectedList = [...currentSelectedList];
    updatedSelectedList[userIndex] = !updatedSelectedList[userIndex];
    // Build new Option
    final updatedOption = state.quizModel!.quizList![quizIndex].options![optionIndex].copyWith(
      users: updatedList,
    );

// Build new Options List
    final updatedOptions = [
      ...state.quizModel!.quizList![quizIndex].options!,
    ];
    updatedOptions[optionIndex] = updatedOption;

// Build new Quiz
    final updatedQuiz = state.quizModel!.quizList![quizIndex].copyWith(
      options: updatedOptions,
    );

// Build new QuizList
    final updatedQuizList = [...state.quizModel!.quizList!];
    updatedQuizList[quizIndex] = updatedQuiz;

// Finally, update state
    state = state.copyWith(
      quizModel: state.quizModel!.copyWith(
        quizList: updatedQuizList,

      ),
      isOptionSelected: updatedSelectedList
    );

    // isOptionSelected[index] = !isOptionSelected[index];
    // state = state.copyWith(isOptionSelected: isOptionSelected);
    //
    // // final updated = {...state.selectedIndexes};
    // // if (updated.contains(index)) {
    // //   updated.remove(index);
    // // } else {
    // //   updated.add(index);
    // // }
    // //
    // // state = state.copyWith(
    // //   selectedIndexes: updated,
    // //   isSelected: updated.isNotEmpty,
    // // );
  }

  void clear() {
    // state = QuizSelectionState(selectedIndexes: {}, isSelected: false);
  }
}

/// Provider
final quizSelectionProvider =
    StateNotifierProvider<QuizSelectionNotifier, QuizSelectionState>((ref) {
  return QuizSelectionNotifier();
});
