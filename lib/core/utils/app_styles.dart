import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';

class AppStyles {
  
  static  TextStyle primaryColorTextW600Size16 = TextStyle(
    color: AppColors.textColor,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    fontFamily: GoogleFonts.poppins().fontFamily
  );
  static  TextStyle primaryColorTextW600Size18 = TextStyle(
    color: AppColors.textColor,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    fontFamily: GoogleFonts.poppins().fontFamily
  );
  static  TextStyle primaryColorTextW600Size24 = TextStyle(
    color: AppColors.textColor,
    fontWeight: FontWeight.w600,
    fontSize: 24,
    fontFamily: GoogleFonts.poppins().fontFamily
  );
  static  TextStyle greyTextW600Size18 = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    fontFamily: GoogleFonts.poppins().fontFamily
  );
}