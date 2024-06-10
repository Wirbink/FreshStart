import 'package:fresh_start/domain/models/Temp/user_model.dart';

abstract class UserRepository{
  Future<UserModel> loadUserData();
}