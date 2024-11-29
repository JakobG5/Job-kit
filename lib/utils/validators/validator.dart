class Validator {
  static String? validateName(String value) {
    if (value.trim().isEmpty) {
      return 'Name cannot be empty';
    } else if (value.length < 2) {
      return 'Enter a valid name';
    }
    return null;
  }

  static String? validatePhoneNumber(String value) {
    if (value.trim().isEmpty) {
      return 'Phone number cannot be empty';
    }
    final phoneRegex = RegExp(r'^\d{10}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Phone number must be 10 digits';
    }
    return null;
  }

  static String? validateEmail(String value) {
    if (value.trim().isEmpty) {
      return 'Email cannot be empty';
    }
    final emailRegex = RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.trim().isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  static String? confirmPassword(String value1, String value2) {
    if (value1.trim().isEmpty) {
      return 'Password cannot be empty';
    } else if (!(value1.length == value2.length)) {
      return 'Password does\'t match';
    }
    return null;
  }

  static String? validateDescription(String value) {
    if (value.trim().isEmpty) {
      return 'Description cannot be empty';
    } else if (value.length < 10) {
      return 'Description must be at least 10 characters';
    }
    return null;
  }

  static String? validateDate(String value) {
    if (value.trim().isEmpty) {
      return 'Date cannot be empty';
    }
    final dateRegex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
    if (!dateRegex.hasMatch(value)) {
      return 'Enter a date in DD/MM/YYYY format';
    }
    return null;
  }
}
