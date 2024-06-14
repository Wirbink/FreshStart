import 'package:fresh_start/domain/models/Auth/login_model.dart';

abstract class LoginRepository {
  Future<LoginModel> loadLoginData();
}