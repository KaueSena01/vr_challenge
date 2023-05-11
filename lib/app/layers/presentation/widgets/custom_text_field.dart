import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vr_challenge/core/theme/app_colors.dart';
import 'package:vr_challenge/core/theme/app_sizes.dart';
import 'package:vr_challenge/core/theme/app_text_styles.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final Color? labelTextColor;
  final String? hintText;
  final Color? hintTextColor;
  final Color? inputTextColor;
  final Color? fillColor;
  final IconData? icon;
  final int minLines;
  final int maxLines;
  final bool isSecret;
  final bool readOnly;
  final bool isInputForm;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final GlobalKey<FormFieldState>? formFieldKey;
  final EdgeInsets? margin;
  final Widget? prefixIcon;

  const CustomTextField({
    Key? key,
    this.labelText,
    this.labelTextColor,
    this.hintText,
    this.hintTextColor,
    this.inputTextColor,
    this.fillColor,
    this.initialValue,
    this.icon,
    this.minLines = 1,
    this.maxLines = 1,
    this.isSecret = false,
    this.readOnly = false,
    this.isInputForm = false,
    this.inputFormatters,
    this.textInputType,
    this.controller,
    this.validator,
    this.onSaved,
    this.formFieldKey,
    this.margin,
    this.prefixIcon,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: TextFormField(
        key: widget.formFieldKey,
        controller: widget.controller,
        readOnly: widget.readOnly,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        validator: widget.validator,
        onSaved: widget.onSaved,
        keyboardType: widget.textInputType,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        style: AppTextStyles.textTheme.labelSmall!.apply(
          color: widget.inputTextColor ?? AppColors.primaryColor,
        ),
        cursorColor: AppColors.labelColor,
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          fillColor: widget.fillColor ?? AppColors.whiteColor,
          contentPadding: widget.isInputForm
              ? EdgeInsets.fromLTRB(
                  AppSizes.size00,
                  AppSizes.size15,
                  AppSizes.size00,
                  AppSizes.size15,
                )
              : null,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelText,
          labelStyle: AppTextStyles.textTheme.bodySmall!.apply(
            color: widget.labelTextColor ?? AppColors.whiteColor,
          ),
          hintText: widget.hintText,
          hintStyle: AppTextStyles.textTheme.labelSmall!.apply(
            color: widget.hintTextColor ?? AppColors.labelColor,
          ),
          prefixIcon: widget.prefixIcon,
          border: widget.isInputForm
              ? UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.courseLabelColor,
                    width: BorderSize.borderSizeSmall,
                  ),
                )
              : null,
          focusedBorder: widget.isInputForm
              ? UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.courseLabelColor,
                    width: BorderSize.borderSizeSmall,
                  ),
                )
              : null,
          enabledBorder: widget.isInputForm
              ? UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.courseLabelColor,
                    width: BorderSize.borderSizeSmall,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
