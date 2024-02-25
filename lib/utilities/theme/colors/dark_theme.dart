import 'package:flutter/material.dart';
import 'colors.dart';

class DarkTheme implements ColorsTheme {
  @override
  Color borderColor = const Color(0xffE7E7E7);

  @override
  Color primary = const Color(0xff2C3639);

  @override
  Color secondery = const Color(0xff3F4E4F);

  @override
  Color inActive = Colors.red;

  @override
  Color greyTitle = const Color(0xff737373);

  @override
  Color background = const Color(0xff3F4E4F);

  @override
  Color error = const Color(0xffFFDA92);

  @override
  Color inactiveProgress = const Color(0xffE7E7E7);
}
