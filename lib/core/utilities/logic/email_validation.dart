import 'package:finalproject/core/utilities/logic/validation_text_field.dart';

class EmailValidation implements ValidationTextField {
  @override
  String? validation(String? val) {
    if (val == null || val.trim().isEmpty || !val.contains('@') || val.length < 6) {
      return 'email should has value that contain @ charachter';
    }
    return null;
  }
}
