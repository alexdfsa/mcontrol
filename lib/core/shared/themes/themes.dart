import 'package:flutter/material.dart';

part 'color_schemes.g.dart';

ThemeData get lightTheme => ThemeData(
      canvasColor: _lightColorScheme.secondaryContainer,
      useMaterial3: true,
      colorScheme: _lightColorScheme,
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: _lightColorScheme.primaryContainer,
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        surfaceTintColor: Colors.black38,
        elevation: 10,
        color: _lightColorScheme.error,
        shape: const CircularNotchedRectangle(),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        //elevation: 0,
        backgroundColor: _lightColorScheme.primary,
        foregroundColor: _lightColorScheme.onPrimary,
      ),
    );

ThemeData get darkTheme => ThemeData(
      canvasColor: _darkColorScheme.secondaryContainer,
      useMaterial3: true,
      colorScheme: _darkColorScheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: _darkColorScheme.primaryContainer,
      ),
    );
