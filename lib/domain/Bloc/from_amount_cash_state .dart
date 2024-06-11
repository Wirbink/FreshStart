import 'package:equatable/equatable.dart';
import 'package:fresh_start/domain/models/amount_cash_express_model.dart';

class AmountCashState extends Equatable {
  final String pay;
  final String account;
  final int clabeDestination;
  final String date;
  final String hour;
  final String withdrawalKey;
  final int securityCode;
  final int amount;
  final bool isValid;

  const AmountCashState({
    required this.pay,
    required this.account,
    required this.clabeDestination,
    required this.date,
    required this.hour,
    required this.withdrawalKey,
    required this.securityCode,
    required this.amount,
    this.isValid = false,
  });

  AmountCashState copyWith({
    String? pay,
    String? account,
    int? clabeDestination,
    String? date,
    String? hour,
    String? withdrawalKey,
    int? securityCode,
    int? amount,
    bool? isValid,
  }) {
    return AmountCashState(
      pay: pay ?? this.pay,
      account: account ?? this.account,
      clabeDestination: clabeDestination ?? this.clabeDestination,
      date: date ?? this.date,
      hour: hour ?? this.hour,
      withdrawalKey: withdrawalKey ?? this.withdrawalKey,
      securityCode: securityCode ?? this.securityCode,
      amount: amount ?? this.amount,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [
        pay,
        account,
        clabeDestination,
        date,
        hour,
        withdrawalKey,
        securityCode,
        amount,
        isValid,
      ];

  factory AmountCashState.fromModel(AmountCashExpressModel model) {
    return AmountCashState(
      pay: model.pay,
      account: model.account,
      clabeDestination: model.clabeDestination,
      date: model.date,
      hour: model.hour,
      withdrawalKey: model.withdrawalKey,
      securityCode: model.securityCode,
      amount: model.amount,
    );
  }
}