import 'package:dartz/dartz.dart';
import 'package:fresh_start/core/error/failures.dart';
import 'package:fresh_start/core/usecases/usecase.dart';
import 'package:fresh_start/features/auth/data/models/login_model.dart';
import 'package:fresh_start/features/auth/domain/repositories/login_repository.dart';

class LoginUseCase implements UseCase<void, LoginParams> {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(LoginParams params) async {
    return await repository.loginUser(params.login);
  }
}

class LoginParams {
  final LoginModel login;

  LoginParams({required this.login});
}