bool validateEmailPassword(String email) {
  // ignore: unnecessary_string_escapes
  const emailRegex = '[a-z0-9]+@[a-z]+\.[a-z]{2,3}';
  if (RegExp(emailRegex).hasMatch(email)) {
    return true;
  }
  return false;
}

bool validatePassword(String password) {
  if (password.length < 6) {
    return false;
  }
  return true;
}

bool validateRequired(String text) {
  if (text.isEmpty) {
    return false;
  }
  return true;
}
