import 'package:color_aap/generated/l10n.dart';
import 'package:flutter/material.dart';
/// Validates email format using regex pattern
String? validateEmail(
  String? input,
  BuildContext context,
) {
  const emailRegex = r'^[^@]+@[^@]+\.[^@]+$';
  if (input == null || input.trim().isEmpty) {
    return S.of(context).enterYourEmail;
  }
  final isValidEmail = RegExp(emailRegex).hasMatch(input);

  if (!isValidEmail) {
    return S.of(context).enterYourEmail;
  }

  return null;
}

/// Validates password strength and complexity requirements
String? validatePassword(
  String? input,
  BuildContext context,
) {
  if (input == null || input.isEmpty) {
    return S.of(context).enterYourPassword;
  }
  if (input.length < 8) {
    return S.of(context).passwordLong;
  }
  const pattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%^&*()_+{}\[\]:;<>,.?~\\/-]).+$';
  if (!RegExp(pattern).hasMatch(input)) {
    return S.of(context).passwordShould;
  }
  return null;
}

/// Validates that repeated password matches the original password
String? validateRepeatPassword(
  String? value,
  String originalPassword,
  BuildContext context,
) {
  if (value == null || value.isEmpty) {
    return S.of(context).repeatYourPassword;
  }
  if (value != originalPassword) {
    return S.of(context).passwordMatch;
  }

  return null;
}
