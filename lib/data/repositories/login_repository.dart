import 'package:fresh_start/domain/models/login_model.dart';

abstract class LoginRepository{
  Future<LoginModel> loadLogin();
}