import 'package:fresh_start/domain/models/Auth/register_model.dart';

abstract class RegisterRepository {
  Future<RegisterModel> loadRegisterData();
}