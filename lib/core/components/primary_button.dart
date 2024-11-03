import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.title,
      this.onPressed,
      this.height,
      this.width,
      this.fontSize,
      this.buttonColor = AppColors.primaryColor,
      this.titleColor = AppColors.white,
      this.isLoading = false,
      this.isDisabled = false,
      this.fontWeight,
      this.isWithBorder = false,
      this.isWhite = false});

  final String title;
  final void Function()? onPressed;
  final double? height, width, fontSize;
  final Color buttonColor;
  final Color titleColor;
  final bool isLoading;
  final bool isDisabled;
  final bool isWithBorder;
  final bool isWhite;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(const EdgeInsets.all(1)),
          elevation: WidgetStateProperty.all(0), // Remove elevation
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return AppColors.primaryColor; // Color when the button is pressed
              } else if (states.contains(WidgetState.disabled)) {
                if (isWhite) {
                  return Colors.transparent; // Disabled white button
                } else {
                  return Colors.grey; // Disabled purple button
                }
              }
              return buttonColor; // Default color
            },
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: isDisabled && isWhite
                  ? const BorderSide(color: Colors.grey) // Border for disabled white button
                  : isWithBorder && isWhite
                      ? const BorderSide(
                          color: AppColors.primaryColor,
                          width: 1.0) // Purple border for white button
                      : BorderSide.none,
            ),
          ),
        ),
        onPressed: isLoading || isDisabled ? null : onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isLoading
                ? const Center(
                    child: SizedBox(
                      height: 12,
                      width: 12,
                      child: CircularProgressIndicator(
                        backgroundColor: AppColors.white,
                      ),
                    ),
                  )
                : Text(
                    title,
                    style: TextStyle(
                      color: isDisabled
                          ? isWhite
                              ? Colors.grey // Text color for disabled white button
                              : AppColors.primaryColor // Text color for disabled primary button
                          : buttonColor == AppColors.primaryColor
                              ? AppColors.white // Text color for primary button
                              : AppColors.primaryColor, // Text color for white button
                      fontWeight: fontWeight ?? FontWeight.w600,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: fontSize ?? 16,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {super.key,
      required this.title,
      this.onPressed,
      this.height,
      this.width,
      this.fontSize,
      this.buttonColor = AppColors.primaryColor,
      this.titleColor = AppColors.white,
      this.isLoading = false,
      this.isDisabled = false,
      this.fontWeight,
      this.isWithBorder = false,
      this.isWhite = false});

  final String title;
  final void Function()? onPressed;
  final double? height, width, fontSize;
  final Color buttonColor;
  final Color titleColor;
  final bool isLoading;
  final bool isDisabled;
  final bool isWithBorder;
  final bool isWhite;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(const EdgeInsets.all(1)),
          elevation: WidgetStateProperty.all(0), // Remove elevation
          backgroundColor: isWhite
              ? WidgetStateProperty.all(AppColors.white)
              : WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.pressed)) {
                      return AppColors.primaryColor; // Color when the button is pressed
                    } else if (states.contains(WidgetState.disabled)) {
                      return Colors.grey; // Disabled purple button
                    } else {
                      return buttonColor; // Default color
                    }
                  },
                ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: isDisabled || isWhite
                  ? const BorderSide(
                      color: AppColors.primaryColor) // Border for disabled white button
                  : isWithBorder && isWhite
                      ? const BorderSide(
                          color: AppColors.primaryColor,
                          width: 1.0,
                        ) // Purple border for white button
                      : BorderSide.none,
            ),
          ),
        ),
        onPressed: isLoading || isDisabled ? null : onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isLoading
                ? const Center(
                    child: SizedBox(
                      height: 12,
                      width: 12,
                      child: CircularProgressIndicator(
                        backgroundColor: AppColors.white,
                      ),
                    ),
                  )
                : Text(
                    title,
                    style: TextStyle(
                      color: isWhite
                          ? AppColors.primaryColor // Text color for disabled white button
                          : AppColors.white, // Text color for disabled purple button
                      // Text color for white button
                      fontWeight: fontWeight ?? FontWeight.w600,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: fontSize ?? 16,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
