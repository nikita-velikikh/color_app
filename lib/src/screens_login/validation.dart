/// Validates email format using regex pattern
String? validateEmail(String? input) {
  const emailRegex = r'^[^@]+@[^@]+\.[^@]+$';
  if (input == null || input.trim().isEmpty) {
    return "Please enter your email";
  }
  final isValidEmail = RegExp(emailRegex).hasMatch(input);

  if (!isValidEmail) {
    return "Please enter valid email";
  }
  return null;
}

/// Validates password strength and complexity requirements
String? validatePassword(String? input) {
  if (input == null || input.isEmpty) {
    return 'Please enter your password';
  }
  if (input.length < 8) {
    return 'Password must be at least 8 characters long';
  }
  const pattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%^&*()_+{}\[\]:;<>,.?~\\/-]).+$';
  if (!RegExp(pattern).hasMatch(input)) {
    return 
    'Password should contain at least 1 capital letter,\n 1 sign and 1 number';

  }
  return null;
}

/// Validates that repeated password matches the original password
String? validateRepeatPassword(String? value, String originalPassword) {
  if (value == null || value.isEmpty) {
    return "Please repeat the password";
  }
  if (value != originalPassword) {
    return "Passwords do not match";
  }
  return null;
}
