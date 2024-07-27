class Validators {
  static String? phoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa un número de teléfono';
    }
    if (value.length != 10) {
      return 'El número de teléfono debe contener 10 digitos';
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
}
