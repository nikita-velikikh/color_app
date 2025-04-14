String? validateEmail(String? input) {
  final emailRegex = (r'^[^@]+@[^@]+\.[^@]+$');
  if (input == null || input.trim().isEmpty) {
    return "Please enter your email";
  }
  final isValidEmail = RegExp(emailRegex).hasMatch(input);

  if (!isValidEmail) {
    return "Please enter valid email";
  }
  return null;
}

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
    return 'Password should contain at least 1 capital letter,\n 1 sign and 1 number';
  }
  return null;
}
