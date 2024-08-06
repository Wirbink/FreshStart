part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class ReloadEvent extends ContactEvent {}

class SubmittedDataEvent extends ContactEvent {
  final CreateContactModel contact;

  const SubmittedDataEvent({required this.contact});

  @override
  List<Object> get props => [contact];
}
