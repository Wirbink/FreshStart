import 'package:fresh_start/data/repositories/login_repository.dart';
import 'package:fresh_start/domain/models/login_model.dart';

class LoginData {
  final LoginRepository repository;

  LoginData(this.repository);

  Future<LoginModel> call() async {
    final loginData = await repository.loadLogin();
    
    final emailRgx = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');


    if (loginData.email.isEmpty){
      throw Exception("Email is Empty");

    }

    if(!emailRgx.hasMatch(loginData.email))
    {
      throw Exception("No tiene formato de correo");
    }

    if (loginData.password.isEmpty){
      throw Exception("Password is empty");
    }

    
    return loginData;

  }
}