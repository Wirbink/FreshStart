import 'package:equatable/equatable.dart';
import 'package:fresh_start/domain/models/Transfers/contact_model.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadHomeDataEvent extends HomeEvent {}

class SenderChanged extends HomeEvent {
  final String sender;

  const SenderChanged(this.sender);

  @override   
  List<Object> get props => [sender];
}

class BalanceChanged extends HomeEvent {
  final double balance;

  const BalanceChanged(this.balance);

  @override  
  List<Object> get props => [balance];
}

class ContactChanged extends HomeEvent {
  final List<ContactModel> contacts;

  const ContactChanged(this.contacts);

  @override  
  List<Object> get props => [contacts];
}

class HomeSubmitted extends HomeEvent {}