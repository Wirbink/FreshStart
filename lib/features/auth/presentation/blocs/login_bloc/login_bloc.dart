import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/features/auth/data/models/login_model.dart';
import 'package:fresh_start/features/auth/domain/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUser;

  LoginBloc({required this.loginUser}) : super(LoginInitial()) {
    on<SubmitLoginEvent>((event, emit) async {
      emit(LoginLoading());
      final failureOrSuccess = await loginUser(LoginParams(login: event.login));
      emit(
        failureOrSuccess.fold(
          (failure) => LoginError(message: failure.message),
          (_) => LoginSuccess(),
        ),
      );
    });
  }
}