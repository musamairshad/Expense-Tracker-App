import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        // scaffoldBackgroundColor: const Color.fromARGB(255, 220, 189, 252),
        // elevatedButtonTheme: ElevatedButtonThemeData(),
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
      ),
      home: const Expenses(),
    ),
  );
}
