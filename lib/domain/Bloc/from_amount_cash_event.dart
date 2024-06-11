import 'package:equatable/equatable.dark';

abstract class AmountCashEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadAmountCashData extends AmountCashEvent {}

class PayChanged extends AmountCashEvent {
  final String pay;

  PayChanged(this.pay);

  @override
  List<Object> get props => [pay];
}

class AccountChanged extends AmountCashEvent {
  final String account;

  AccountChanged(this.account);

  @override
  List<Object> get props => [account];
}

class ClabeDestinationChanged extends AmountCashEvent {
  final int clabeDestination;

  ClabeDestinationChanged(this.clabeDestination);

  @override
  List<Object> get props => [clabeDestination];
}

class DateChanged extends AmountCashEvent {
  final String date;

  DateChanged(this.date);

  @override
  List<Object> get props => [date];
}

class HourChanged extends AmountCashEvent {
  final String hour;

  HourChanged(this.hour);

  @override
  List<Object> get props => [hour];
}

class WithdrawalKeyChanged extends AmountCashEvent {
  final String withdrawalKey;

  WithdrawalKeyChanged(this.withdrawalKey);

  @override
  List<Object> get props => [withdrawalKey];
}

class SecurityCodeChanged extends AmountCashEvent {
  final int securityCode;

  SecurityCodeChanged(this.securityCode);

  @override
  List<Object> get props => [securityCode];
}

class AmountChanged extends AmountCashEvent {
  final int amount;

  AmountChanged(this.amount);

  @override
  List<Object> get props => [amount];
}

class SubmitAmountCash extends AmountCashEvent {}