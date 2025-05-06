import 'package:possy_app/src/feature/account_screen/model/language_model.dart';

import '../../../../core/constant/images.dart';

class LanguageList{
  static List<LanguageModel> languageList = [
    LanguageModel(languageName: 'English (UK)', images: AppImages.englishUk, isSelected: false),
    LanguageModel(languageName: 'English (US)', images: AppImages.englishUs, isSelected: true),
    LanguageModel(languageName: 'French', images: AppImages.france, isSelected: false),
    LanguageModel(languageName: 'Japan', images: AppImages.japan, isSelected: false),
    LanguageModel(languageName: 'Korea', images: AppImages.korea, isSelected: false),
    LanguageModel(languageName: 'Russia', images: AppImages.russia, isSelected: false),
    LanguageModel(languageName: 'Thailand', images: AppImages.thailand, isSelected: false),
  ];
}