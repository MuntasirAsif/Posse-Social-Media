class LanguageModel {
  final String languageName;
  final String images;
  final bool isSelected;
  LanguageModel({
    required this.languageName,
    required this.images,
    required this.isSelected,
  });
  LanguageModel copyWith({
    String? languageName,
    String? images,
    bool? isSelected,
  }) {
    return LanguageModel(
      languageName: languageName ?? this.languageName,
      images: images ?? this.images,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  String toString() =>
      'LanguageModel(languageName: $languageName, images: $images, isSelected: $isSelected)';
}
