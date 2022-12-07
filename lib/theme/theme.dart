import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trasn_human_resource_managment/color/appcolor.dart';

class CustomTheme {
  static ThemeData lightTheme() {
    return ThemeData(
        primarySwatch: Colors.orange,
        textTheme: TextTheme(
          bodyText1: GoogleFonts.inter(
              fontSize: 12.sp,
              color: Colors.black45,
              fontWeight: FontWeight.w500),
          bodyText2: GoogleFonts.inter(
              fontSize: 15.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500),
          headline4: GoogleFonts.inter(
              fontSize: 28.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600),
          headline5: GoogleFonts.poppins(
              fontSize: 22.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500),
          headline6: GoogleFonts.poppins(
              fontSize: 16.sp,
              color: Colors.white,
              fontWeight: FontWeight.w400),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(10),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r))))),
        bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: bottomSheetColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              topRight: Radius.circular(15.r),
            ))));
  }

  static ThemeData darkTheme() {
    return ThemeData(
        brightness: Brightness.dark,
        bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.white30,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ))));
  }
}
