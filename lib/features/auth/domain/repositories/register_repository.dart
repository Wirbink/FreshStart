import 'package:dartz/dartz.dart';
import 'package:fresh_start/core/error/failures.dart';
import 'package:fresh_start/features/auth/data/models/register_model.dart';

abstract class RegisterRepository {
  Future<Either<Failure, void>> createUser(RegisterModel register);
}