import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/Login/login_event.dart';
import 'package:fresh_start/core/presentation/bloc/Login/login_state.dart';
import 'package:fresh_start/domain/usecases/Login/login_data.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginData loginData;

  LoginBloc(this.loginData)
      : super(const LoginState(
            email: '', password: '', remember: false)) {
    on<LoadLoginDataEvent>((event,emit) async {
      final login = await loginData();
      emit(LoginState.fromModel(login));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
        email: event.email, isValid: _vadilateLogin()
      ));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
        password: event.password, isValid: _vadilateLogin()
      ));
    });

    on<RememberChanged>((event, emit) {
      emit(state.copyWith(
        remember: event.remember, isValid: _vadilateLogin()
      ));
    });
    
    }
    
    bool _vadilateLogin() {
      final model = state;
      return model.email.isNotEmpty &&
      model.password.isEmpty &&
      model.remember == null;
    }
}