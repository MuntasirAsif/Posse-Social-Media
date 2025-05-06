import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/src/model/ansModel.dart';

class AnswerListNotifier extends StateNotifier<List<AnswerModel>> {
  AnswerListNotifier() : super([

    AnswerModel(
            title: "Rayna",
            hasAnswered: false,
            answer: "A blender – powerful and messy but gets the job done!",
          ),
          AnswerModel(
            title: "Takia",
            hasAnswered: false,
            answer: "i want cocklet",
          ),
          AnswerModel(
            title: "shakin",
            hasAnswered: false,
            answer: "Microwave – fast, convenient, but sometimes overlooked.",
          ),
        
          
  ]);

  void addAnswer(String title, bool hasAnswered, String? answer) {
    final newAnswer = AnswerModel(
      title: title,
      hasAnswered: hasAnswered,
      answer: answer,
    );
    state = [...state, newAnswer];
  }

  void clearAnswers() {
    state = [];
  }
}

final answerListProvider = StateNotifierProvider<AnswerListNotifier, List<AnswerModel>>(
  (ref) => AnswerListNotifier(),
);
final isAnswerSentProvider = StateProvider<bool>((ref) => false);
