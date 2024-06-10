import 'package:fresh_start/domain/models/Temp/status_account_model.dart';

abstract class StatusAccountRepository{
  Future<StatusAccountModel> loadStatusAccountData();
}