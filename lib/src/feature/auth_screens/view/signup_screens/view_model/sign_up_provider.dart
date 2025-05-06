import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/src/feature/auth_screens/view/signup_screens/model/sign_up_model.dart';

class SignUpProvider extends StateNotifier<SignUpModel> {
  SignUpProvider() : super(const SignUpModel());

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
    // debugPrint("toggle password visibility: $state}");
  }

  void toggleConfirmPasswordVisibility(){
    state = state.copyWith(isConfirmPasswordVisible: !state.isConfirmPasswordVisible);
    debugPrint("\n\ntoggle confirm password visibility: $state\n\n");
  }

  void checkIsLoading(){
    state = state.copyWith(isLoading: !state.isLoading);
  }
}

final signUpProvider = StateNotifierProvider<SignUpProvider, SignUpModel>(
  (ref) => SignUpProvider(),
);
