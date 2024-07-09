import 'package:fresh_start/domain/models/Auth/login_model.dart';
import 'package:fresh_start/domain/repositories/Auth/login_repository.dart';

class LoginData {
  final LoginRepository repository;

  LoginData(this.repository);

  Future<void> call(LoginModel login) async {
    final loginData = await repository.loginUser(login);
    
    // final emailRgx = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');


    // if (loginData.email.isEmpty){
    //   throw Exception("Email is Empty");

    // }

    // if(!emailRgx.hasMatch(loginData.email))
    // {
    //   throw Exception("No tiene formato de correo");
    // }

    // if (loginData.password.isEmpty){
    //   throw Exception("Password is empty");
    // }

    
    return loginData;

  }
}