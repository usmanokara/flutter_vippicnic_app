import 'dart:ui';

import 'package:vippicnic/models/user_model.dart';

const kPrimaryColor = Color(0xFF3F3D56);
const kSecondryColor = Color(0xFFFFC43B);
const kGreyColor = Color(0xFFF5F5F6);

Function kEmailValidator = (emailValue) {
  if (emailValue.isEmpty) {
    return 'Email cannot be empty';
  }
  String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+";
  RegExp regExp = new RegExp(p);
  if (regExp.hasMatch(emailValue)) {
    return null;
  } else {
    return 'Email Syntax is not Correct';
  }
};

class Constants {
  static UserModel currentUser;
}
