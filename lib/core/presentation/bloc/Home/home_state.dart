import 'package:equatable/equatable.dart';
import 'package:fresh_start/domain/models/CashExpress/cash_express_model.dart';
import 'package:fresh_start/domain/models/Transfers/contact_model.dart';

class HomeState extends Equatable {
  final String sender;
  final double balance;
  final List<ContactModel> contacts;

  const HomeState({
    this.sender = '', this.balance = 0.0, this.contacts = const []
  });

  factory HomeState.fromModel(CashExpressModel cashExpressModel, List<ContactModel> contactsModel){
    return HomeState(
      sender: cashExpressModel.sender, balance: cashExpressModel.balance, contacts: contactsModel
    );
  }

  HomeState copyWith({
    String? sender,
    double? balance,
    List<ContactModel>? contacts,
    bool? isValid
  }) {
    return HomeState(
      sender: sender ?? this.sender,
      balance: balance ?? this.balance,
      contacts: contacts ?? this.contacts
    );
  }

  @override
  List<Object> get props => [sender, balance, contacts];
}