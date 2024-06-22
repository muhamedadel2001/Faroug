import 'package:finalproject/core/utilities/logic/validation_text_field.dart';

class PasswordValidation implements ValidationTextField {
  final String errorMsg =
      'password should has value and greater than or equal 8 characters';
  @override
  String? validation(String? val) {
    if (val == null || val.isEmpty || val.length < 8) {
      return errorMsg;
    }
    return null;
  }
}
