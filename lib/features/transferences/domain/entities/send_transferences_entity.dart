class SendTransferencesEntity {
  double amount;
  String user_account;
  String receptor_account;
  String concept;
  String owner;

  SendTransferencesEntity(
      {required this.amount,
      required this.user_account,
      required this.receptor_account,
      required this.concept,
      required this.owner});
}
