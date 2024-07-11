import 'package:fresh_start/domain/models/Auth/register_model.dart';
import 'package:fresh_start/domain/repositories/Auth/register_repository.dart';

class RegisterData {
  final RegisterRepository repository;

  RegisterData(this.repository);

  Future<void> call(RegisterModel register) async {
    final registerData = await repository.submitUser(register);
    // status success fail error
    // if (registerData.name.isEmpty) {
    //   throw Exception("Name cannot be empty");
    // }

    // if (registerData.lastname.isEmpty) {
    //   throw Exception("Lastname cannot be empty");
    // }

    // final emailRgx = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    // if (registerData.email.isEmpty) {
    //   throw Exception("Email cannot be empty");
    // }
    // if (!emailRgx.hasMatch(registerData.email)) {
    //   throw Exception("Invalid email format");
    // }

    // if (registerData.rfc.length != 13) {
    //   throw Exception("RFC must be 13 characters long");
    // }

    // if (registerData.phone.length < 10) {
    //   throw Exception("Phone number must be at least 10 digits");
    // }

    // if (registerData.password.length < 6) {
    //   throw Exception("Password must be at least 6 characters long");
    // }

    // if (registerData.country.isEmpty) {
    //   throw Exception("Country cannot be empty");
    // }

    // if (!registerData.acceptedTerms) {
    //   throw Exception("You must accept the terms");
    // }

    return registerData;
  }
}
