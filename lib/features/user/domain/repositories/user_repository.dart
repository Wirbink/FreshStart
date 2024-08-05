import 'package:dartz/dartz.dart';
import 'package:fresh_start/core/error/failures.dart';
import 'package:fresh_start/features/user/data/models/user_model.dart';
import 'package:fresh_start/features/user/data/models/user_update_model.dart';
import 'package:fresh_start/features/user/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserModel>> getUser();
  Future<Either<Failure, void>> updateUser(UserUpdateModel user);
}