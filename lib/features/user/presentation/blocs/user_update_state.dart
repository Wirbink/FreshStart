part of 'user_update_bloc.dart';

abstract class UserUpdateState extends Equatable {
  const UserUpdateState();

  @override
  List<Object> get props => [];
}

class UserUpdateInitial extends UserUpdateState {}

class UserUpdateLoading extends UserUpdateState {}

class UserUpdateLoaded extends UserUpdateState {
  final UserModel user;

  const UserUpdateLoaded({required this.user});

  @override
  List<Object> get props => [user];
}

class UserUpdateSuccess extends UserUpdateState {}

class UserUpdateErrorLoaded extends UserUpdateState {
  final String message;

  const UserUpdateErrorLoaded({required this.message});

  @override
  List<Object> get props => [message];
}

class UserUpdateErrorSubmited extends UserUpdateState {
  final String message;

  const UserUpdateErrorSubmited({required this.message});

  @override
  List<Object> get props => [message];
}
