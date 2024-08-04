import 'package:fresh_start/features/statement_account/data/models/card_model.dart';
import 'package:fresh_start/features/user/data/models/user_model.dart';

class AccountEntity {
  int id;
  int id_user;
  double balance;
  int status;
  List<CardModel> card;
  UserModel user;

  AccountEntity(
      {required this.id,
      required this.id_user,
      required this.balance,
      required this.status,
      required this.card,
      required this.user});
}
