import 'package:dartz/dartz.dart';
import 'package:fresh_start/core/error/failures.dart';
import 'package:fresh_start/features/auth/data/models/login_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, void>> loginUser(LoginModel login);
  Future<void> logout();
}