String? validateEmail(String input) {
  const emailRegex = r'^(?=.*[a-zA-Z])(?=.*[A-Z])(?=.*\d).+$';

  if (RegExp(emailRegex).hasMatch(input)) {
    return "Invalid Email";
  } else {
    return null;
  }
}
