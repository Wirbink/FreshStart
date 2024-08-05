import 'package:dartz/dartz.dart';
import 'package:fresh_start/core/error/failures.dart';
import 'package:fresh_start/core/usecases/usecase.dart';
import 'package:fresh_start/features/user/data/models/user_update_model.dart';
import 'package:fresh_start/features/user/domain/repositories/user_repository.dart';

class UserUpdateUseCase implements UseCase<void, UserUpdateParams> {
  final UserRepository repository;

  UserUpdateUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(UserUpdateParams params) async {
    return await repository.updateUser(params.user);
  }
}

class UserUpdateParams {
  final UserUpdateModel user;

  UserUpdateParams({required this.user});
}
