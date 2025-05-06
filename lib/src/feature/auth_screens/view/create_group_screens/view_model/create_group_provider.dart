import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/src/feature/auth_screens/view/create_group_screens/model/create_group_model.dart';

class CreateGroupProvider extends StateNotifier<CreateGroupModel>{
  CreateGroupProvider() : super(CreateGroupModel());

  void selectLabel(String label){
    state = state.copyWith(selectedLabel: label);
  }
}

final createGroupProvider = StateNotifierProvider<CreateGroupProvider,CreateGroupModel>(
    (ref) => CreateGroupProvider(),
);