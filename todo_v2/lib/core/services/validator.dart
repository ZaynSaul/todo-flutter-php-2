class ValidatorService {
  ValidatorService._();

  static String? validateEmail(
    String? value,
  ) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }

    final emailRegExp = RegExp(
      r"^(?:[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$",
    ).hasMatch(
      value,
    );

    if (!emailRegExp) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? validatePassword(
    String? value, {
    String? oldPassword,
    String? confirmPassword,
  }) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    if (value.length < 8) {
      return 'Password must be at least 7 characters';
    }
    if (confirmPassword != null && value != confirmPassword) {
      return 'Passwords must match!';
    }
    if (oldPassword != null && value == oldPassword) {
      return 'Password must not match with old password';
    }
    return null;
  }

  static String? validateTextInputs(
    String? value,
    String? name,
  ) {
    if (value == null || value.isEmpty) {
      return "$name field is required";
    }

    return null;
  }
}
