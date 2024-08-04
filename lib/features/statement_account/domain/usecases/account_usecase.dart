import 'package:dartz/dartz.dart';
import 'package:fresh_start/core/error/failures.dart';
import 'package:fresh_start/core/usecases/usecase.dart';
import 'package:fresh_start/features/statement_account/data/models/account_model.dart';
import 'package:fresh_start/features/statement_account/domain/repositories/account_repository.dart';

class AccountUseCase implements UseCase<AccountModel, NoParams> {
  final AccountRepository repository;

  AccountUseCase(this.repository);

  @override
  Future<Either<Failure, AccountModel>> call(NoParams params) async {
    return await repository.getAccount();
  }
}
