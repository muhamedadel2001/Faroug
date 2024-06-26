import 'package:finalproject/core/utilities/logic/validation_text_field.dart';

class NumberValidation implements ValidationTextField {
  final String errorMsg = 'Please enter correct number';

  @override
  String? validation(String? val) {
    if (val == null ||
        val.trim().isEmpty ||
        double.tryParse(val) == null ||
        double.parse(val) < 0) {
      return errorMsg;
    }
    return null;
  }
}
