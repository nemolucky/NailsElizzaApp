import 'package:flutter/material.dart';

class TextStyles {

  static const TextStyle splashTitle = TextStyle(
    fontFamily: "Fredoka",
    fontSize: 36,
    letterSpacing: 0,
    color: Color.fromRGBO(71, 71, 71, 1),
    decoration: TextDecoration.none,
  );

  static const TextStyle title = TextStyle(
    fontFamily: "Montserrat",
    fontSize: 36,
    letterSpacing: 0,
    color: Color.fromRGBO(255, 44, 164, 1),
  );

  static const TextStyle smallText = TextStyle(
      fontFamily: "Montserrat",
      fontSize: 15,
      letterSpacing: 0,
      color: Color.fromRGBO(71, 71, 71, 0.6),
  );

  static const TextStyle blackSmallText = TextStyle(
      fontFamily: "Montserrat",
      fontSize: 14,
      letterSpacing: 0,
      color: Color.fromRGBO(71, 71, 71, 1),
  );  

  static const TextStyle mediumText = TextStyle(
      fontFamily: "Montserrat",
      fontSize: 20,
      letterSpacing: 0,
      color: Color.fromRGBO(255, 255, 255, 1),
  );

  static const TextStyle calendarHeader = TextStyle(
    fontFamily: 'OpenSans',
    letterSpacing: 0,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: Color.fromRGBO(71, 71, 71, 1)
  );

  static const TextStyle calendarDay = TextStyle(
    fontFamily: 'OpenSans',
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: Color.fromRGBO(71, 71, 71, 1)
  );

  static const TextStyle calendarOutsideDay = TextStyle(
    fontFamily: 'OpenSans',
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: Color.fromRGBO(170, 170, 170, 1)
  ); 

  static const TextStyle calendarSelectedDay = TextStyle(
    fontFamily: 'OpenSans',
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
    fontSize: 15,
    color: Colors.white
  ); 

}