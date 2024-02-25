import 'package:flutter/material.dart';
import 'colors.dart';

class LightTheme implements ColorsTheme {
  @override
  Color borderColor = Color(0xffE7E7E7);

  @override
  Color primary = Colors.black;

  @override
  Color secondery = Colors.white;

  @override
  Color inActive = Colors.red;

  @override
  Color greyTitle = Color(0xff737373);

  @override
  Color background = const Color(0xffffffff);

  @override
  Color error = const Color(0xffF70000);

  @override
  Color inactiveProgress = const Color(0xffE7E7E7);
}
