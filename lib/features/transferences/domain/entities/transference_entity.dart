class TransferenceEntity {
  int id;
  double amount;
  String sender_account;
  String receptor_account;
  String concept;
  String owner;

  TransferenceEntity(
      {required this.id,
      required this.amount,
      required this.sender_account,
      required this.receptor_account,
      required this.concept,
      required this.owner});
}
