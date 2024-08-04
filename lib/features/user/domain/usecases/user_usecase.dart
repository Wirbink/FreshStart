import 'package:dartz/dartz.dart';
import 'package:fresh_start/core/error/failures.dart';
import 'package:fresh_start/core/usecases/usecase.dart';
import 'package:fresh_start/features/user/data/models/user_model.dart';
import 'package:fresh_start/features/user/domain/repositories/user_repository.dart';

class UserUseCase implements UseCase<void, NoParams> {
  final UserRepository repository;
  
  UserUseCase(this.repository);

  @override
  Future<Either<Failure, UserModel>> call(NoParams noParams) async {
    return await repository.getUser();
  }
}