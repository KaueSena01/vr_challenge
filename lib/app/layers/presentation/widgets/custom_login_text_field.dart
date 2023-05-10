import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vr_challenge/core/constants/theme/app_colors.dart';
import 'package:vr_challenge/core/constants/theme/app_sizes.dart';
import 'package:vr_challenge/core/constants/theme/app_text_styles.dart';

class CustomLoginTextField extends StatefulWidget {
  final String? labelText;
  final Color? labelTextColor;
  final String? hintText;
  final Color? hintTextColor;
  final bool isSecret;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final GlobalKey<FormFieldState>? formFieldKey;

  const CustomLoginTextField({
    Key? key,
    this.labelText,
    this.labelTextColor,
    this.hintText,
    this.hintTextColor,
    this.isSecret = false,
    this.readOnly = false,
    this.inputFormatters,
    this.textInputType,
    this.controller,
    this.validator,
    this.formFieldKey,
  }) : super(key: key);

  @override
  State<CustomLoginTextField> createState() => _CustomLoginTextFieldState();
}

class _CustomLoginTextFieldState extends State<CustomLoginTextField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.formFieldKey,
      controller: widget.controller,
      readOnly: widget.readOnly,
      inputFormatters: widget.inputFormatters,
      obscureText: isObscure,
      validator: widget.validator,
      keyboardType: widget.textInputType,
      textAlign: TextAlign.center,
      style: AppTextStyles.textTheme.labelSmall!.apply(
        color: AppColors.whiteColor,
      ),
      decoration: InputDecoration(
        fillColor: AppColors.primaryColor.withOpacity(0.6),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: widget.labelText,
        labelStyle: AppTextStyles.textTheme.headlineSmall!.apply(
          color: widget.labelTextColor ?? AppColors.whiteColor,
        ),
        hintText: widget.hintText,
        hintStyle: AppTextStyles.textTheme.labelSmall!.apply(
          color: widget.hintTextColor ?? AppColors.whiteColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            BorderRadiusSize.borderRadiusSmall,
          ),
          borderSide: BorderSide(
            color: AppColors.whiteColor,
            width: BorderSize.borderSizeSmall,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            BorderRadiusSize.borderRadiusSmall,
          ),
          borderSide: BorderSide(
            color: AppColors.whiteColor,
            width: BorderSize.borderSizeSmall,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            BorderRadiusSize.borderRadiusSmall,
          ),
          borderSide: BorderSide(
            color: AppColors.whiteColor,
            width: BorderSize.borderSizeSmall,
          ),
        ),
      ),
    );
  }
}
