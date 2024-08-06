part of 'contact_bloc.dart';


abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactSuccess extends ContactState {}

class ContactError extends ContactState {
  final String message;

  const ContactError({required this.message});

  @override
  List<Object> get props => [message];
}