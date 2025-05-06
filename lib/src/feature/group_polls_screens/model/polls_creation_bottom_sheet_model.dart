class PollsCreationBottomSheetModel {
  final List<String> options;
  final List<List<String>> optionTile;
  final String pollQuestion;

  /// pollCounter
  final int pollCounter1;
  final int pollCounter2;
  final int pollCounter3;
  final int pollCounter4;
  final int totalPollCounter;
  final double pollPercentage1;
  final double pollPercentage2;
  final double pollPercentage3;
  final double pollPercentage4;

  const PollsCreationBottomSheetModel({
    this.options = const [],
    this.optionTile = const [],
    this.pollQuestion = "",
    this.pollCounter1 = 0,
    this.pollCounter2 = 0,
    this.pollCounter3 = 0,
    this.pollCounter4 = 0,
    this.totalPollCounter = 0,
    this.pollPercentage1 = 0.0,
    this.pollPercentage2 = 0.0,
    this.pollPercentage3 = 0.0,
    this.pollPercentage4 = 0.0
  });

  PollsCreationBottomSheetModel copyWith({
    List<String>? options,
    List<List<String>>? optionTile,
    String? pollQuestion,
    int? pollCounter1,
    int? pollCounter2,
    int? pollCounter3,
    int? pollCounter4,
    int? totalPollCounter,
    double? pollPercentage1,
    double? pollPercentage2,
    double? pollPercentage3,
    double? pollPercentage4
  }) {
    return PollsCreationBottomSheetModel(
      options: options ?? this.options,
      optionTile: optionTile ?? this.optionTile,
      pollQuestion: pollQuestion ?? this.pollQuestion,
      pollCounter1: pollCounter1 ?? this.pollCounter1,
      pollCounter2: pollCounter2 ?? this.pollCounter2,
      pollCounter3: pollCounter3 ?? this.pollCounter3,
      pollCounter4: pollCounter4 ?? this.pollCounter4,
      totalPollCounter: totalPollCounter ?? this.totalPollCounter,
      pollPercentage1: pollPercentage1 ?? this.pollPercentage1,
      pollPercentage2: pollPercentage2 ?? this.pollPercentage2,
      pollPercentage3: pollPercentage3 ?? this.pollPercentage3,
      pollPercentage4: pollPercentage4 ?? this.pollPercentage4
    );
  }
}
