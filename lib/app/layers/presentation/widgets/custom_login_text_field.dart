import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vr_challenge/core/constants/theme/app_colors.dart';
import 'package:vr_challenge/core/constants/theme/app_text_styles.dart';

class CustomLoginTextField extends StatefulWidget {
  final String? labelText;
  final Color? labelTextColor;
  final String? hintText;
  final Color? hintTextColor;
  final Color? inputTextColor;
  final IconData? icon;
  final int maxLines;
  final bool isSecret;
  final bool readOnly;
  final bool darkBorder;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final GlobalKey<FormFieldState>? formFieldKey;
  final EdgeInsets? margin;

  const CustomLoginTextField({
    Key? key,
    this.labelText,
    this.labelTextColor,
    this.hintText,
    this.hintTextColor,
    this.inputTextColor,
    this.initialValue,
    this.icon,
    this.maxLines = 1,
    this.isSecret = false,
    this.readOnly = false,
    this.darkBorder = false,
    this.inputFormatters,
    this.textInputType,
    this.controller,
    this.validator,
    this.onSaved,
    this.formFieldKey,
    this.margin,
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
    return Container(
      margin: widget.margin,
      child: TextFormField(
        key: widget.formFieldKey,
        controller: widget.controller,
        readOnly: widget.readOnly,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        validator: widget.validator,
        onSaved: widget.onSaved,
        keyboardType: widget.textInputType,
        maxLines: widget.maxLines,
        textAlign: TextAlign.center,
        style: AppTextStyles.textTheme.labelSmall!.apply(
          color: widget.inputTextColor ?? AppColors.whiteColor,
        ),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelText,
          labelStyle: AppTextStyles.textTheme.headlineSmall!.apply(
            color: widget.labelTextColor ?? AppColors.whiteColor,
          ),
          hintText: widget.hintText,
          hintStyle: AppTextStyles.textTheme.labelSmall!.apply(
            color: widget.hintTextColor ?? AppColors.whiteColor,
          ),
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(
                    isObscure ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.primaryColor,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
