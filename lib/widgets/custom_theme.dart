import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';
import '../utils/utils.dart';

class MyTheme {
  static final theme = ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBgColor,
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: Colors.white),
      colorScheme: const ColorScheme.light(secondary: Colors.transparent),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        centerTitle: false,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 1,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(const TextTheme(
        bodySmall: TextStyle(fontSize: 12, height: 1.83),
        bodyLarge:
            TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.375),
        bodyMedium: TextStyle(fontSize: 14, height: 1.5714),
        labelLarge:
            TextStyle(fontSize: 16, height: 2, fontWeight: FontWeight.w600),
        // titleLarge: const TextStyle(
        //     fontSize: 16, height: 2, fontWeight: FontWeight.w600),
      )),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 64),
          backgroundColor: primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll<double>(0.0),
          splashFactory: NoSplash.splashFactory,
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0))),
          shadowColor: const MaterialStatePropertyAll<Color>(transparent),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: blackColor,
        selectionColor: blackColor,
        selectionHandleColor: blackColor,
      ),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: primaryColor));
}
