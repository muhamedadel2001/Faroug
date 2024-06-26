import 'package:finalproject/core/utilities/logic/validation_text_field.dart';

class StringValidation implements ValidationTextField {
  final String errorMsg = 'Empty field required';

  @override
  String? validation(String? val) {
    if (val == null || val.trim().isEmpty) {
      return errorMsg;
    }
    return null;
  }
}
