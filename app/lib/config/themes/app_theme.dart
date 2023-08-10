import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const colorList = <MaterialColor>[
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.teal,
  Colors.cyan,
  Colors.lime,
  Colors.indigo,
  Colors.amber,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey,
];

class AppTheme {
  final int? color;

  AppTheme({this.color});

  ThemeData getTheme() {
    final colorScheme = color == null
        ? ColorScheme.fromSwatch(
            primarySwatch: colorList[Random().nextInt(colorList.length)])
        : ColorScheme.fromSwatch(primarySwatch: colorList[color!]);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: GoogleFonts.caveatTextTheme().copyWith(
        bodyLarge:
            GoogleFonts.caveat(fontSize: 25, fontWeight: FontWeight.w700),
        bodyMedium:
            GoogleFonts.caveat(fontSize: 20, fontWeight: FontWeight.w700),
        bodySmall:
            GoogleFonts.caveat(fontSize: 15, fontWeight: FontWeight.w700),
        titleLarge:
            GoogleFonts.caveat(fontSize: 40, fontWeight: FontWeight.w700),
        titleMedium:
            GoogleFonts.caveat(fontSize: 30, fontWeight: FontWeight.w700),
        titleSmall:
            GoogleFonts.caveat(fontSize: 25, fontWeight: FontWeight.w700),
        labelSmall:
            GoogleFonts.caveat(fontSize: 15, fontWeight: FontWeight.w700),
        labelMedium:
            GoogleFonts.caveat(fontSize: 20, fontWeight: FontWeight.w700),
        labelLarge:
            GoogleFonts.caveat(fontSize: 25, fontWeight: FontWeight.w700),
      ),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 5,
          color: colorScheme.secondary,
          shadowColor: colorScheme.secondary),
    );
  }
}
