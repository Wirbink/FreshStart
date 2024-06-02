import 'package:fresh_start/domain/repositories/account_status_repository.dart';
import 'package:fresh_start/domain/models/account_status_model.dart';

abstract class AccountStatusRepository{
  Future<AccountStatusModel> loadAccountStatusData();
}