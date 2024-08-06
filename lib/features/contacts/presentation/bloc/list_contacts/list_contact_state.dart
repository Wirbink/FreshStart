part of 'list_contact_bloc.dart';

abstract class ListContactState extends Equatable {
  const ListContactState();

  @override
  List<Object> get props => [];
}

class ListContactInitial extends ListContactState {}

class ListContactLoading extends ListContactState {}

class ListContactSuccess extends ListContactState {
  final List<ContactModel> contact;

  const ListContactSuccess({required this.contact});

  @override
  List<Object> get props => [contact];
}

class ListContactError extends ListContactState {
  final String message;

  const ListContactError({required this.message});

  @override
  List<Object> get props => [message];
}
