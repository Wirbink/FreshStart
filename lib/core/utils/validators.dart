class Validators {
  static String? phoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu número de teléfono';
    }
    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return 'El número de teléfono debe tener 10 dígitos';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu contraseña';
    }
    if (value.length < 8) {
      return 'La contraseña debe tener al menos 8 caracteres';
    }
    if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
      return 'La contraseña debe tener al menos una mayúscula';
    }
    if (!RegExp(r'^(?=.*[0-9])').hasMatch(value)) {
      return 'La contraseña debe tener al menos un número';
    }
    if (!RegExp(r'^(?=.*[!@#$%^&*(),.?":{}|<>])').hasMatch(value)) {
      return 'La contraseña debe tener al menos un símbolo especial';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu nombre';
    }
    if (value.length > 50) {
      return 'El nombre no debe superar 50 caracteres';
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'El nombre solo debe contener letras y espacios';
    }
    return null;
  }

  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu apellido';
    }
    if (value.length > 50) {
      return 'El apellido no debe superar 50 caracteres';
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'El apellido solo debe contener letras y espacios';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu email';
    }
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return 'Por favor ingresa un email válido';
    }
    return null;
  }

  static String? validateRFC(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu RFC';
    }
    if (!RegExp(r'^[A-ZÑ&]{3,4}\d{6}[A-Z\d]{3}$').hasMatch(value)) {
      return 'Por favor ingresa un RFC válido';
    }
    return null;
  }

  static String? validateBankId(String? value) {
    if (value == null || value.isEmpty) {
      return 'El ID de banco no debe estar vacío';
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'El ID de banco debe ser un número';
    }
    return null;
  }
}
