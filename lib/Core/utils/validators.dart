String? validateUsername(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your username';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your email';
  }
  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value.trim())) {
    return 'Incorrect e-mail format';
  }
  return null;
}

String? validatePhoneCode(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter the country code';
  }
  return null;
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your phone number';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  if (value.length < 6) {
    return 'The password must be at least 6 characters confirm your username';
  }
  return null;
}

String? validateConfirmPassword(String? value, String originalPassword) {
  if (value == null || value.isEmpty) {
    return 'Please confirm your password';
  }
  if (value != originalPassword) {
    return 'The tow passwords are not identical';
  }
  return null;
}
