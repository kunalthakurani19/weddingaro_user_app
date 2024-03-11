import 'package:flutter/material.dart';

class WATextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? whichValidation;
  final String? hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool isEnabled;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final bool showBorder;
  final int? maxlines;
  final Function(String)? onChanged;

  const WATextFormField({
    Key? key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.isEnabled = true,
    this.validator,
    this.suffixIcon,
    this.showBorder = true,
    this.maxlines,
    this.whichValidation,
    this.onChanged,
  }) : super(key: key);

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    }
    // You can add a more sophisticated email validation regex if needed
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }

    // Check if the password is greater than 6 characters
    if (value.length <= 6) {
      return 'Password must be greater than 6 characters';
    }

    return null;
  }

  String? _validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Feild is Required';
    }
    // You can customize the password validation rules as needed

    return null;
  }

  String? _validateMaxLength(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    // You can customize the maximum length as needed
    if (value.length > 20) {
      return 'Maximum length exceeded (20 characters)';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    // Check if the value is numeric
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Please enter a valid numeric value';
    }

    // Check if the value has exactly 10 digits
    if (value.length != 10) {
      return 'Please enter a 10-digit numeric value';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxlines ?? 1,
      enabled: isEnabled,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        isDense: true,
        suffixIcon: suffixIcon,
        border: showBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              )
            : null,
      ),
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator ??
          (whichValidation == 'Email'
              ? _validateEmail
              : (whichValidation == 'Password'
                  ? _validatePassword
                  : (whichValidation == 'Max Length'
                      ? _validateMaxLength
                      : (whichValidation == 'Number'
                          ? _validatePhoneNumber
                          : _validateEmpty)))),
    );
  }
}
