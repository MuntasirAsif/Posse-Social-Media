import 'package:possy_app/src/feature/vibe_check_screen/model/quiz_option_Model.dart';

class VibeCheckQuizModel {
  final String quizId;
  final DateTime dateTime;
  final String questionTitle;
  final List<QuizOption> quizOption;

  VibeCheckQuizModel({
    required this.quizId,
    required this.dateTime,
    required this.questionTitle,
    required this.quizOption,
  });

  factory VibeCheckQuizModel.fromJson(Map<String, dynamic> json) {
    return VibeCheckQuizModel(
      quizId: json['quizId'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      questionTitle: json['questionTitle'] as String,
      quizOption:
          (json['quizOption'] as List)
              .map((option) => QuizOption.fromJson(option))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quizId': quizId,
      'dateTime': dateTime.toIso8601String(),
      'questionTitle': questionTitle,
      'quizOption': quizOption.map((option) => option.toJson()).toList(),
    };
  }
}
