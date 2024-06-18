import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class LoadContactDataEvent extends ContactEvent {}

class ClabeChanged extends ContactEvent {
  final String clabe;

  const ClabeChanged(this.clabe);

  @override
  List<Object> get props => [clabe];
}

class CardNumberChanged extends ContactEvent {
  final String cardNumber;

  const CardNumberChanged(this.cardNumber);

  @override
  List<Object> get props => [cardNumber];
}

class SpentChanged extends ContactEvent {
  final double spent;

  const SpentChanged(this.spent);

  @override
  List<Object> get props => [spent];
}

class DateChanged extends ContactEvent {
  final DateTime date;

  const DateChanged(this.date);

  @override
  List<Object> get props => [date];
}

class BillChanged extends ContactEvent {
  final String bill;

  const BillChanged(this.bill);

  @override
  List<Object> get props => [bill];
}

class VoucherChanged extends ContactEvent {
  final String voucher;

  const VoucherChanged(this.voucher);

  @override
  List<Object> get props => [voucher];
}

class ContactSubmitted extends ContactEvent {}
