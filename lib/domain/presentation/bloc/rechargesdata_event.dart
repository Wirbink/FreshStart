import 'package:equatable/equatable.dart';

abstract class RechargesdataEvent extends Equatable {
  const RechargesdataEvent();

  @override
  List<Object?> get props => [];
}
//LoadRechargesDataEvent
class Load_rechargesdataEvent extends RechargesdataEvent {}

class phoneNumberChanged extends RechargesdataEvent {
  final int phoneNumber;

  const phoneNumberChanged(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumberChanged];
}

class PayWithChanged extends RechargesdataEvent {
  final String payWith;

  const PayWithChanged(this.payWith);

  @override
  List<Object?> get props => [payWith];
}

class RechargeTypeChanged extends RechargesdataEvent {
  final String rechargeType;

  const RechargeTypeChanged(this.rechargeType);

  @override
  List<Object?> get props => [rechargeType];
}

class SentAmountChanged extends RechargesdataEvent {
  final double sentAmount;

  const SentAmountChanged(this.sentAmount);

  @override
  List<Object?> get props => [sentAmount];
}

class TermsAcceptedChanged extends RechargesdataEvent {
  final bool termsAccepted;

  const TermsAcceptedChanged(this.termsAccepted);

  @override
  List<Object?> get props => [termsAccepted];
}

class FormSubmitted extends RechargesdataEvent {}
