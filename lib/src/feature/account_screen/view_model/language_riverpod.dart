import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/src/feature/account_screen/model/language_model.dart';

class LanguageNotifier extends StateNotifier<List<LanguageModel>> {
  LanguageNotifier(List<LanguageModel> initialLanguage)
      : super(_initialSorted(initialLanguage));

  static final languageProvider = StateNotifierProvider.autoDispose
      .family<LanguageNotifier, List<LanguageModel>, List<LanguageModel>>(
        (ref, initialLanguage) => LanguageNotifier(initialLanguage),
  );

  static List<LanguageModel> _initialSorted(List<LanguageModel> list) {
    return [
      ...list.where((lang) => lang.isSelected),
      ...list
          .where((lang) => !lang.isSelected)
          .toList()
        ..sort((a, b) => a.languageName.compareTo(b.languageName)),
    ];
  }

  void selectedLanguage(int index) {
    final updated = [
      for (int i = 0; i < state.length; i++)
        state[i].copyWith(isSelected: i == index),
    ];

    state = _initialSorted(updated);
  }
}
