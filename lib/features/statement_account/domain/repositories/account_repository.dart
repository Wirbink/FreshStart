import 'package:dartz/dartz.dart';
import 'package:fresh_start/core/error/failures.dart';
import 'package:fresh_start/features/statement_account/data/models/account_model.dart';

abstract class AccountRepository {
  Future<Either<Failure,AccountModel>> getAccount();
}