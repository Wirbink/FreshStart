import 'package:equatable/equatable.dart';
import 'package:fresh_start/domain/models/Auth/login_model.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final bool remember;

  const LoginState(
      {this.email = '', this.password = '', this.remember = false});

  factory LoginState.fromModel(LoginModel model) {
    return LoginState(
        email: model.email, password: model.password, remember: model.remember);
  }

  LoginState copyWith({
    String? email,
    String? password,
    bool? remember,
    bool? isValid
  }) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        remember: remember ?? this.remember);
  }

  @override
  List<Object> get props => [email, password, remember];
}
