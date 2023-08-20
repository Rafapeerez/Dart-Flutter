import 'package:flutter/material.dart';

const colorList = <Color>[Colors.red, Colors.orange, Colors.pink, Colors.blue];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false,

  })  : assert(selectedColor >= 0, 'Selected color must be greater than 0'),
        assert(selectedColor < colorList.length, 'Selected color must be less or equals than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    )
  );

  //Importante para tener las propiedades final y el estado inmutable. MUY UTIL
  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkMode
  }) => AppTheme( 
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkMode ?? this.isDarkMode
  );
}
