import 'package:flutter/material.dart';

import '../../modules/login/login_screen.dart';
import '../network/local/cash_helper.dart';
import 'components.dart';

void signOut(context) {
  CashHelper.removeData(key: 'uId').then((value) {
    if (value) {
      navigateAndFinish(context, LoginScreen());
    }
  });
}

String? uId;

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
);
