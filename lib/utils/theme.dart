import 'package:flutter/material.dart';

ThemeData protonTheme() {
  TextTheme _protonTextTheme(TextTheme base) {
    return base.copyWith(
        headline1: base.headline1.copyWith(
            fontFamily: 'quicksand', color: Color(0xffDFDFDF), fontSize: 20.0),
        headline2: base.headline2.copyWith(
          fontFamily: 'quicksand',
          color: Colors.black,
          fontSize: 15.0,
        ),
        headline3: base.headline3.copyWith(
          fontFamily: 'quicksand',
          color: Colors.white,
          fontSize: 18.0,
        ),
        headline4: base.headline4.copyWith(
          fontFamily: 'quicksand',
          color: Colors.black,
          fontSize: 18.0,
        ));
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: _protonTextTheme(base.textTheme),
    primaryColor: Color(0xff303030),
    scaffoldBackgroundColor: Color(0xffDFDFDF),
  );
}
