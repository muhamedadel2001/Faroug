import 'package:finalproject/features/sign_up/manager/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignupStates> {
  SignUpCubit()
      : super(SignupStates(countries: [
          "Egypt",
          "KSA",
          "UAE",
          "Jordan",
          "Lebanon",
          "Qatar",
          "Saudi Arabia"
        ]));

  void selectCountry(String? country) {
    emit(state.copyWith(selectedCountry: country));
  }
}
