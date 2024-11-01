import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';


class CustomFormField extends StatefulWidget {
  const CustomFormField({
    super.key,
    this.controller,
    this.type,
    this.label,
    this.hintText,
    this.error,
    this.isMandatory = false,
    this.isOptional = false,
    this.textArea = false,
    this.isPassword = false,
    this.isPhoneNumber = false,
    this.onChanged,
    this.onSubmitted,
    this.hintStyle,
    this.alignHint,
    this.align,
    this.suffix,
    this.suffixPressed,
    this.width,
    //this.textDirection,
    this.textInputAction,
    this.focusNode,
    this.prefix,
    this.shouldFocus = true,
    this.height,
    this.onTapTextFiled,
    this.readOnly,
    this.nestedReplyName,
    this.onTapCloseNestedReply,
    this.autofillHints,
    this.validator,
    this.borderRadius,
  });

  final TextEditingController? controller;
  final TextInputType? type;
  final String? label;
  final String? hintText, error, nestedReplyName;
  final bool isMandatory, isOptional, textArea, isPhoneNumber, isPassword;
  final Function(String value)? onChanged, onSubmitted;
  final TextStyle? hintStyle;
  final TextDirection? alignHint;
  final Alignment? align;
  final Widget? suffix;
  final Widget? prefix;
  final Function()? suffixPressed;
  final double? width, height, borderRadius;

  //final TextDirection? textDirection;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final void Function()? onTapCloseNestedReply;
  final bool? shouldFocus, readOnly;
  final void Function()? onTapTextFiled;
  final Iterable<String>? autofillHints;
  final String? Function(String? text)? validator;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  //final void Function()? onTapCloseNestedReply;
  bool _obscureText = true;
  bool isFocused = false;
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !widget.shouldFocus!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Container(
              child: widget.label!.isNotEmpty && !widget.isMandatory && !widget.isOptional
                  ? Text(widget.label!, style: AppStyles.primaryColorTextW600Size14)
                  : widget.isMandatory || widget.isOptional
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(widget.label!, style: AppStyles.primaryColorTextW600Size14),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              widget.isOptional ? AppStrings.optional : AppStrings.requiredSymbol,
                              style: AppStyles.primaryColorTextW600Size14,
                            ),
                          ],
                        )
                      : Container(),
            ),
          const SizedBox(height: 10),
          SizedBox(
            width: widget.width,
            child: TextFormField(
              readOnly: widget.readOnly ?? false,
              onTap: widget.onTapTextFiled,
              focusNode: widget.focusNode,
              //textDirection: textDirection,
              validator: widget.validator,
              onFieldSubmitted: widget.onSubmitted,
              controller: widget.controller,
              minLines: widget.textArea ? 3 : 1,
              maxLines: widget.textArea ? 5 : 1,
              keyboardType: widget.type,
              obscureText: widget.isPassword ? _obscureText : !_obscureText,
              textInputAction: widget.textInputAction ?? TextInputAction.go,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                errorText: widget.error,
              


                hintText: widget.hintText ?? '',
                hintStyle: widget.hintStyle ??
                    TextStyle(
                      color:  Colors.grey,
                      fontSize: 12,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w400,
                    ),
                fillColor: Colors.white,
                alignLabelWithHint: true,
                // hintTextDirection: alignHint ?? TextDirection.ltr,
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                filled: true,
                // fillColor: ColorManager.bkgTextInput,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
                  borderSide: const BorderSide(color:  Colors.grey, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
                  borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
                  borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
                  borderSide: const BorderSide(color:  Colors.grey, width: 1),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
                  borderSide: const BorderSide(color:  Colors.grey, width: 1),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
                  borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
                ),
                suffixIcon: (widget.isPassword && widget.suffix == null)
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText ? Icons.visibility_off : Icons.visibility,
                          color:  Colors.grey,
                        ),
                      )
                    : (widget.suffix != null)
                        ? GestureDetector(onTap: widget.suffixPressed, child: widget.suffix)
                        : null,
                prefixIcon: widget.prefix,

                focusColor: AppColors.primaryColor,
              ),
              cursorColor: Colors.grey,
            ),
          ),
          // const SizedBox(height: 2),
          // Text(
          //   widget.error ?? '',
          //   style: AppStyles.errorText,
          // ),
          // Row(mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       widget.error ?? '',
          //       style: AppStyles.errorText,
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
