part of 'user_update_bloc.dart';

abstract class UserUpdateEvent extends Equatable {
  const UserUpdateEvent();

  @override
  List<Object> get props => [];
}

class GetDataEvent extends UserUpdateEvent {}

class SubmittedDataEvent extends UserUpdateEvent {
  final UserUpdateModel update;

  const SubmittedDataEvent({required this.update});

  @override
  List<Object> get props => [update];
}