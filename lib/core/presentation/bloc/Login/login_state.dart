import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginError extends LoginState {
  final String message;

  const LoginError(this.message);

  @override
  List<Object> get props => [message];
}


// import 'package:equatable/equatable.dart';
// import 'package:fresh_start/domain/models/Auth/login_model.dart';

// class LoginState extends Equatable {
//   final String email;
//   final String password;
//   final bool remember;

//   const LoginState(
//       {this.email = '', this.password = '', this.remember = false});

//   factory LoginState.fromModel(LoginModel model) {
//     return LoginState(
//         email: model.email, password: model.password, remember: model.remember);
//   }

//   LoginState copyWith({
//     String? email,
//     String? password,
//     bool? remember,
//     bool? isValid
//   }) {
//     return LoginState(
//         email: email ?? this.email,
//         password: password ?? this.password,
//         remember: remember ?? this.remember);
//   }

//   @override
//   List<Object> get props => [email, password, remember];
// }
