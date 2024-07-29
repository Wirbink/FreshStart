import 'package:dartz/dartz.dart';
import 'package:fresh_start/core/error/failures.dart';
import 'package:fresh_start/core/usecases/usecase.dart';
import 'package:fresh_start/features/auth/data/models/register_model.dart';
import 'package:fresh_start/features/auth/domain/repositories/register_repository.dart';

class RegisterUsecase implements UseCase<void, RegisterParams> {
  final RegisterRepository repository;

  RegisterUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterParams params) async {
    return await repository.createUser(params.register);
  }
}

class RegisterParams {
  final RegisterModel register;

  RegisterParams({
    required this.register
  });
}
