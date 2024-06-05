import 'package:fresh_start/domain/models/account_status_model.dart';
import 'package:fresh_start/domain/repositories/account_status_repository.dart';

class load_account_status{
  final AccountStatusRepository repository;

  load_account_status(this.repository);

  Future<AccountStatusModel> call() async {
    final account_status_repository_impl = await repository.loadAccountStatusData();

    if(account_status_repository_impl.myAccount.isEmpty) {
      throw Exception("myAccount cannot be empaty");
    }

    if(account_status_repository_impl.availableBalance == null) {
      throw Exception("availableBalance cannot be empaty");
    }

    return account_status_repository_impl;

  }
}