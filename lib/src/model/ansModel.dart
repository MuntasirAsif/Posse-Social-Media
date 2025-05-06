class AnswerModel {
  final String title;
  final bool hasAnswered;
  final String? answer;

  AnswerModel({
    required this.title,
    required this.hasAnswered,
    required this.answer,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      title: json['title'],
      hasAnswered: json['hasAnswered'],
      answer: json['answer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'hasAnswered': hasAnswered,
      'answer': answer,
    };
  }
}
