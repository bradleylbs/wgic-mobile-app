import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final Color _darkPrimaryColor = Color(0xFF1E2836); // Blue-tinted dark gray for cards
  static const Color _darkOnPrimaryColor = Colors.white;
  static const Color _darkBackgroundColor = Colors.black;
  static const Color _darkAccentColor = Colors.white; // For buttons, highlights

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: _darkBackgroundColor,
    primaryColor: _darkPrimaryColor,
    colorScheme: ColorScheme.dark(
      primary: _darkAccentColor, // Used for active elements like buttons
      secondary: _darkAccentColor, // Can be used for FABs, etc.
      surface: _darkPrimaryColor, // Card backgrounds
      onPrimary: Colors.black, // Text on primary buttons
      onSecondary: Colors.black,
      onSurface: _darkOnPrimaryColor, // Text on cards and background
      error: Colors.redAccent,
      onError: Colors.white,
    ),
    textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
      displayLarge: const TextStyle(color: _darkOnPrimaryColor, fontWeight: FontWeight.bold),
      displayMedium: const TextStyle(color: _darkOnPrimaryColor, fontWeight: FontWeight.bold),
      displaySmall: const TextStyle(color: _darkOnPrimaryColor, fontWeight: FontWeight.bold),
      headlineLarge: const TextStyle(color: _darkOnPrimaryColor, fontWeight: FontWeight.bold),
      headlineMedium: const TextStyle(color: _darkOnPrimaryColor, fontWeight: FontWeight.bold),
      headlineSmall: const TextStyle(color: _darkOnPrimaryColor, fontWeight: FontWeight.bold),
      titleLarge: const TextStyle(color: _darkOnPrimaryColor, fontWeight: FontWeight.bold, fontSize: 20),
      titleMedium: const TextStyle(color: _darkOnPrimaryColor, fontSize: 16),
      titleSmall: const TextStyle(color: _darkOnPrimaryColor, fontSize: 14),
      bodyLarge: const TextStyle(color: _darkOnPrimaryColor, fontSize: 16),
      bodyMedium: const TextStyle(color: _darkOnPrimaryColor, fontSize: 14),
      bodySmall: TextStyle(color: Colors.grey[400], fontSize: 12),
      labelLarge: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16), // For button text
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF1E2836),
      elevation: 0,
      iconTheme: const IconThemeData(color: _darkOnPrimaryColor),
      titleTextStyle: GoogleFonts.inter(
        color: _darkOnPrimaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardThemeData(
      color: _darkPrimaryColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Increased border radius to match screenshot
        side: BorderSide(color: Color(0xFF374151), width: 0.5), // Blue-tinted border
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF252D3A), // Blue-tinted input background
      hintStyle: TextStyle(color: Colors.grey[400]),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: _darkAccentColor),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: _darkAccentColor,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _darkAccentColor,
        foregroundColor: Colors.black, // Text color
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        textStyle: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _darkOnPrimaryColor,
        side: BorderSide(color: Color(0xFF374151)), // Updated border color
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        textStyle: GoogleFonts.inter(fontWeight: FontWeight.bold),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _darkAccentColor,
        textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
      ),
    ),
    iconTheme: const IconThemeData(color: _darkOnPrimaryColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E2836), // Updated to match cards
      selectedItemColor: _darkOnPrimaryColor,
      unselectedItemColor: Colors.grey[500],
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w600),
      unselectedLabelStyle: GoogleFonts.inter(fontSize: 10),
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey[400],
      indicator: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
    ),
  );
}