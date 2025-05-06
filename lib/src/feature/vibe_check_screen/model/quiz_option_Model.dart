class QuizOption {
  final String title;
  final List<String> imageUrls;
  final bool isSelected;

  QuizOption({
    required this.title,
    required this.imageUrls,
    this.isSelected = false,
  });

  QuizOption copyWith({bool? isSelected}) {
    return QuizOption(
      title: title,
      imageUrls: imageUrls,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  factory QuizOption.fromJson(Map<String, dynamic> json) {
    return QuizOption(
      title: json['title'] as String,
      imageUrls: List<String>.from(json['imageUrls']),
      isSelected: json['isSelected'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'imageUrls': imageUrls,
      'isSelected': isSelected,
    };
  }
}
