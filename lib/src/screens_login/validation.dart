String? validateEmail(String? input) {
  final emailRegex = r'^(?=.*[a-zA-Z])(?=.*[A-Z])(?=.*\d).+$';
  if (input == null) {
    return "Email is null";
  }
  final isValidEmail = RegExp(emailRegex).hasMatch(input);

  if (!isValidEmail) {
    return "Invalid Email";
  }
  return null;
}

String? validatePassword(String? input) {
  if (input == null || input.isEmpty) {
    return 'Invalid Password';
  }
  const pattern = r'^(?=.*[a-zA-Z])(?=.*[A-Z])(?=.*\d).+$';
  if (!RegExp(pattern).hasMatch(input)) {
    return 'Invalid Password';
  }
  return null;
}
