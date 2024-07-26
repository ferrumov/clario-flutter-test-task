import 'package:flutter/material.dart';

import 'package:clario_auth_test_app/styles/colors.dart';

class InputBorderType {
  static const InputBorder focused = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(
      width: 1.0,
      color: Color.fromRGBO(111, 145, 188, 1),
    ),
  );

  static const InputBorder error = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(
      width: 1.0,
      color: AppColors.red,
    ),
  );

  static const success = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(
      width: 1.0,
      color: AppColors.green,
    ),
  );

  static const enabled = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(
      width: 1.0,
      color: Colors.transparent,
    ),
  );
}
