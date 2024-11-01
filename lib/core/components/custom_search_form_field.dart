import 'package:flutter/material.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';


class CustomSearchFormField extends StatelessWidget {
  const CustomSearchFormField({
    super.key,
    required this.controller,
    this.type,
    this.label,
    this.onChanged,
    this.onSubmitted,
    this.hintText,
    this.error,
    this.validator,
    this.prefixPressed,
    this.prefix,
    this.suffixPressed,
    this.suffix,
    this.textArea = false,
    this.isPassword = false,
    this.textDirection,
    this.textInputAction,
  });
  final TextEditingController controller;
  final TextInputType? type;
  final String? label;
  final Function(String value)? onChanged;
  final Function(String)? onSubmitted;
  final String? hintText;
  final String? error;
  final FormFieldValidator<String>? validator;
  final Function()? prefixPressed;
  final Widget? prefix;
  final Function()? suffixPressed;
  final Widget? suffix;
  final bool textArea, isPassword;
  final TextDirection? textDirection;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // onSubmitted: onSubmitted,
      textDirection: textDirection,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      controller: controller,
      minLines: textArea ? 5 : 1,
      maxLines: textArea ? 8 : 1,
      keyboardType: type,
      obscureText: isPassword,
      textInputAction: textInputAction ?? TextInputAction.go,
      onChanged: onChanged,

      decoration: InputDecoration(
        errorText: error,
        //errorStyle: AppStyles.errorText,
        hintText: hintText ?? '',
        hintTextDirection: textDirection,
        label: Text(label ?? ''),
        labelStyle: AppStyles.primaryColorTextW600Size14,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        fillColor: Colors.transparent,
        alignLabelWithHint: true,
        // hintTextDirection: alignHint ?? TextDirection.ltr,
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        filled: true,
        // fillColor: ColorManager.bkgTextInput,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 0),
        ),

        prefixIcon: prefix != null
            ? GestureDetector(
                onTap: prefixPressed,
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
                  child: prefix,
                ),
              )
            : const SizedBox(),
        suffixIcon: suffix != null
            ? GestureDetector(
                onTap: suffixPressed,
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(AppColors.secondaryColor, BlendMode.srcIn),
                  child: suffix,
                ),
              )
            : const SizedBox(),
        focusColor: AppColors.primaryColor,
      ),
      cursorColor: AppColors.primaryColor,
    );
  }
}
