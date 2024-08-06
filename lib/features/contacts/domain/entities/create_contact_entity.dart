class CreateContactEntity {
  String nickname;
  String email;
  String phone;
  String bankname;
  String account;

  CreateContactEntity(
      {required this.nickname,
      required this.email,
      required this.phone,
      required this.account,
      required this.bankname});
}
