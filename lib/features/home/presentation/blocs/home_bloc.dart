import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/usecases/usecase.dart';
import 'package:fresh_start/features/statement_account/data/models/account_model.dart';
import 'package:fresh_start/features/statement_account/domain/usecases/account_usecase.dart';
import 'package:fresh_start/features/transferences/data/model/transference_model.dart';
import 'package:fresh_start/features/transferences/data/model/transference_specific_model.dart';
import 'package:fresh_start/features/transferences/domain/usecases/transferences_usecase.dart';
import 'package:fresh_start/features/user/data/models/user_model.dart';
import 'package:fresh_start/features/user/domain/usecases/user_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserUseCase userUseCase;
  final AccountUseCase accountUseCase;
  final TransferencesUseCase transferencesUseCase;

  HomeBloc(
      {required this.userUseCase,
      required this.accountUseCase,
      required this.transferencesUseCase})
      : super(HomeInitial()) {
    on<GetDataEvent>((event, emit) async {
      emit(HomeLoading());

      final userResult = await userUseCase(NoParams());
      final accountResult = await accountUseCase(NoParams());
      final transferencesResult = await transferencesUseCase(NoParams());

      userResult.fold(
        (userFailure) => emit(HomeError(message: userFailure.message)),
        (user) {
          accountResult.fold(
            (accountFailure) =>
                emit(HomeError(message: accountFailure.message)),
            (account) {
              transferencesResult.fold(
                  (transferencesFailure) =>
                      emit(HomeError(message: transferencesFailure.message)),
                  (transferences) => emit(HomeSuccess(
                      user: user,
                      account: account,
                      transferences: transferences)));
            },
          );
        },
      );
    });
  }
}
