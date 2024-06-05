import 'package:fresh_start/domain/models/send_money_model.dart';

abstract class TransfersRepository{
  Future<SendMoneyModel> loadTransfer();
}