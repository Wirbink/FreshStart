import 'package:fresh_start/domain/models/register_model.dart';

abstract class RegisterRepository {
  Future<RegisterModel> loadRegister();
}