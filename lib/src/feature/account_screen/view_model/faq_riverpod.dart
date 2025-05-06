import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/src/feature/account_screen/data/faq_data.dart';
import 'package:possy_app/src/feature/account_screen/model/faq_model.dart';

class FAQNotifier extends StateNotifier<List<FAQModel>>{
  FAQNotifier(super.initialStateNotifier);
  void toggleFAQ(int index) {
    state[index] = state[index].copyWith(isExpanded: !state[index].isExpanded);
    state = [...state];
  }
}

final faqNotifierProvider = StateNotifierProvider<FAQNotifier, List<FAQModel>>((ref) {
  return FAQNotifier(faqList);
});
