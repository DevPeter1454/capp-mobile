
extension FormFieldValidators on String {
  bool isValidPassword() {
    // Password must be more than 6 characters, contain alphanumeric, at least one uppercase and special character
    if (isEmpty) return false;

    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[_!@#\$&*~]).{6,}$';
    final passwordPattern = RegExp(pattern);
    return passwordPattern.hasMatch(this);
  }

  bool isValidEmail() {
    // Standard email field validation
    if (isEmpty) return false;
    final emailPattern = RegExp(
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailPattern.hasMatch(this);
  }

  bool isValidName() {
    // Name must not be empty
    return trim().isNotEmpty;
  }

  bool isValidUsername() {
    // Username must be more than 2 characters
    if (isEmpty) return false;
    return length > 2;
  }

  bool isValidPhone() {
    // Standard phone field validation, allows only numbers
    if (isEmpty) return false;
    final phonePattern = RegExp(r'^[0-9]+$');
    return phonePattern.hasMatch(this);
  }

  bool isSameAs(String other) {
    // Check if the current string is the same as the other string
    return this == other;
  }
}