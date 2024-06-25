import 'package:equatable/equatable.dart';

abstract class AddNewContactEvent extends Equatable {
  const AddNewContactEvent();

  @override
  List<Object> get props => [];
}

class LoadAddNewContactDataEvent extends AddNewContactEvent {}

class CardNumberChanged extends AddNewContactEvent {
  final String cardNumber;

  const CardNumberChanged(this.cardNumber);

  @override
  List<Object> get props => [cardNumber];
}

class AddNewContactSubmitted extends AddNewContactEvent {}