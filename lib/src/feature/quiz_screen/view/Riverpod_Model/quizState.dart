import 'package:possy_app/src/model/grQuizModel.dart';
import 'package:possy_app/src/model/possy_users_model.dart';

/// State class to hold selected indexes and a global isSelected flag
class QuizSelectionState {
  final Set<int>? selectedIndexes;

  final QuizModel? quizModel;

  final List<bool>? isOptionSelected;

  final PossyUsersModel? usersModel;

  QuizSelectionState({
    this.quizModel,
    this.selectedIndexes,
    this.isOptionSelected = null,
    this.usersModel,
  });

  QuizSelectionState copyWith({
    QuizModel? quizModel,
    Set<int>? selectedIndexes,
    List<bool>? isOptionSelected,
    PossyUsersModel? usersModel,
  }) {
    return QuizSelectionState(
      quizModel: quizModel ?? this.quizModel,
      selectedIndexes: selectedIndexes ?? this.selectedIndexes,
      isOptionSelected: isOptionSelected ?? this.isOptionSelected,
      usersModel: usersModel ?? this.usersModel,
    );
  }
}


