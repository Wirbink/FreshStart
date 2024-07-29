class RegisterEntity {
  String name;
  String lastname;
  String email;
  String rfc;
  String phone;
  String password;
  int id_bank;

  RegisterEntity(
      {required this.name,
      required this.lastname,
      required this.email,
      required this.rfc,
      required this.phone,
      required this.password,
      required this.id_bank});
}
