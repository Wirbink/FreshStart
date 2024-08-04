class CardEntity {
  int id;
  int id_account;
  String card;
  String card_account;
  int status;

  CardEntity({
    required this.id,
    required this.id_account,
    required this.card,
    required this.card_account,
    required this.status,
  });
}