import 'package:flutter/widgets.dart';

BoxShadow commonBoxshdow({double blurRadius = 30}) {
  return  BoxShadow(
    color: const Color(0x19000000),
    blurRadius: blurRadius,
    offset: const Offset(0, 5),
    spreadRadius: 0,
  );
}
