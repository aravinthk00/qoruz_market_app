import 'package:flutter/material.dart';

class AppTheme {
  // Primary colors
  static final Color primaryPink = Color.fromRGBO(251, 42, 119, 1);
  static final Color primaryOrange = Color.fromRGBO(255, 115, 4, 1);
  
  // Secondary colors
  static final Color secondaryPink = Color.fromRGBO(251, 42, 119, 0.8);
  static final Color secondaryOrange = Color.fromRGBO(255, 115, 4, 0.8);
  
  // Text colors
  static final Color textPrimary = Color.fromRGBO(33, 33, 33, 1);
  static final Color textSecondary = Color.fromRGBO(117, 117, 117, 1);
  static final Color textWhite = Color.fromRGBO(255, 255, 255, 1);
  
  // Background colors
  static final Color backgroundLight = Color.fromRGBO(250, 250, 250, 1);
  static final Color backgroundDark = Color.fromRGBO(30, 30, 30, 1);
  
  // Card colors
  static final Color cardLight = Color.fromRGBO(255, 255, 255, 1);
  static final Color cardDark = Color.fromRGBO(50, 50, 50, 1);
  
  // Border colors
  static final Color borderLight = Color.fromRGBO(224, 224, 224, 1);
  static final Color borderDark = Color.fromRGBO(81, 81, 81, 1);

  // high value colors
  static final Color primaryHighOrange = Color.fromRGBO(254, 156, 19, 1);
  static final Color secondaryHighOrange = Color.fromRGBO(251, 148, 40, 1);

  // Border colors
  static final Color iconColorLight = Colors.grey[400]!;
  static final Color iconColorDark = Colors.grey[200]!;

  static final Color whatsappBackgroundGreen = Color(0xFF075E54);
  static final Color whatsappTealGreen = Color(0xFF128C7E);
  static final Color whatsappUFOGreen = Color(0xFF25D366);
  static final Color whatsappteaGreen = Color(0xFFDCF8C6);

  static final Color linkedInBlue = const Color(0xFF0a66c2);

  static final Color greyBackground = const Color.fromRGBO(245, 246, 251, 1);

  static final Color buttonColor = const Color.fromRGBO(254, 69, 69, 1);
  
  // Gradient
  static Gradient get appBarGradient => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryOrange, primaryPink],
  );
  
  static Gradient get highValueGradient => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryHighOrange, secondaryHighOrange],
  );

  // Light theme
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryPink,
      colorScheme: ColorScheme.light(
        primary: primaryPink,
        secondary: primaryOrange,
        background: backgroundLight,
        surface: cardLight,
        onPrimary: textWhite,
        onSecondary: textWhite,
        onBackground: textPrimary,
        onSurface: textPrimary,
      ),
      scaffoldBackgroundColor: backgroundLight,
      appBarTheme: AppBarTheme(
        color: cardLight,
        elevation: 0,
        iconTheme: IconThemeData(color: textPrimary),
        titleTextStyle: TextStyle(
          color: textWhite,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        color: cardLight,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: textPrimary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: textPrimary,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: textSecondary,
          fontSize: 14,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: textWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryPink,
          side: BorderSide(color: primaryPink),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
      iconTheme: IconThemeData(
        color: primaryPink,
      ),
      dividerColor: borderLight,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cardLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: borderLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: borderLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: primaryPink),
        ),
      ),
    );
  }

  // Dark theme
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryPink,
      colorScheme: ColorScheme.dark(
        primary: primaryPink,
        secondary: primaryOrange,
        background: backgroundDark,
        surface: cardDark,
        onPrimary: textWhite,
        onSecondary: textWhite,
        onBackground: textWhite,
        onSurface: textWhite,
      ),
      scaffoldBackgroundColor: backgroundDark,
      appBarTheme: AppBarTheme(
        color: cardDark,
        elevation: 0,
        iconTheme: IconThemeData(color: textWhite),
        titleTextStyle: TextStyle(
          color: textWhite,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        color: cardDark,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: textWhite,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: textWhite,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: textWhite,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: Color.fromRGBO(200, 200, 200, 1),
          fontSize: 14,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryPink,
          foregroundColor: textWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryPink,
          side: BorderSide(color: primaryPink),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
      iconTheme: IconThemeData(
        color: primaryPink,
      ),
      dividerColor: borderDark,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cardDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: borderDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: borderDark),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: primaryPink),
        ),
      ),
    );
  }

  // Custom text styles
  static TextStyle get heading1 {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: textPrimary,
    );
  }

  static TextStyle get heading2 {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: textPrimary,
    );
  }

  static TextStyle get heading3 {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: textPrimary,
    );
  }

  static TextStyle get label {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: textPrimary,
    );
  }

  static TextStyle get label2 {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: textPrimary,
    );
  }

  static TextStyle get buttonLable {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: textWhite,
    );
  }

  static TextStyle get highLable {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: textWhite,
    );
  }

  static TextStyle get bodyText {
    return TextStyle(
      fontSize: 14,
      color: Colors.grey[600],
    );
  }

  static TextStyle get caption {
    return TextStyle(
      fontSize: 12,
      color: textSecondary,
    );
  }

  // Custom button styles
  static ButtonStyle get pinkButton {
    return ElevatedButton.styleFrom(
      backgroundColor: primaryPink,
      foregroundColor: textWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    );
  }

  static ButtonStyle get orangeButton {
    return ElevatedButton.styleFrom(
      backgroundColor: primaryOrange,
      foregroundColor: textWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    );
  }

  static ButtonStyle get outlinedPinkButton {
    return OutlinedButton.styleFrom(
      foregroundColor: primaryPink,
      side: BorderSide(color: primaryPink),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    );
  }

  static ButtonStyle get gradientButton {
    return ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ).copyWith(
      backgroundColor: WidgetStateProperty.all(Colors.transparent),
      shadowColor: WidgetStateProperty.all(Colors.transparent),
      foregroundColor: WidgetStateProperty.all(textWhite),
    );
  }
}