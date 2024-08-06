part of 'list_contact_bloc.dart';

abstract class ListContactEvent extends Equatable {
  const ListContactEvent();

  @override
  List<Object> get props => [];
}

class GetDataEvent extends ListContactEvent {}
