import 'package:equatable/equatable.dart';
import 'package:fresh_start/core/presentation/bloc/TransfersInternational/transfers_international_event.dart';
import 'package:fresh_start/domain/models/Transfers/contact_model.dart';

abstract class TransfersContactEvent extends Equatable {
  const TransfersContactEvent();

  @override
  List<Object> get props => [];
}

class LoadTranfersContactDataEvent extends TransfersContactEvent {}

class ContactsChanged extends TransfersContactEvent {
  final List<ContactModel> contacts;

  const ContactsChanged(this.contacts);

  @override
  List<Object> get props => [contacts];
}

class TransfersContactSubmitted extends TransfersContactEvent {}