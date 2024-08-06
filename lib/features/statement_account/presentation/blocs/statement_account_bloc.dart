import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/usecases/usecase.dart';
import 'package:fresh_start/features/statement_account/data/models/account_model.dart';
import 'package:fresh_start/features/statement_account/domain/usecases/account_usecase.dart';
import 'package:fresh_start/features/transferences/data/model/transference_model.dart';
import 'package:fresh_start/features/transferences/domain/usecases/transferences_usecase.dart';

part 'statement_account_event.dart';
part 'statement_account_state.dart';

class StatementAccountBloc
    extends Bloc<StatementAccountEvent, StatementAccountState> {
  final AccountUseCase accountUseCase;
  final TransferencesUseCase transferencesUseCase;

  StatementAccountBloc(
      {required this.accountUseCase, required this.transferencesUseCase})
      : super(StatementAccountInitial()) {
    on<GetDataEvent>((event, emit) async {
      emit(StatementAccountLoading());
      final accountResult = await accountUseCase(NoParams());
      final transfernceResult = await transferencesUseCase(NoParams());

      accountResult.fold(
          (failure) => emit(StatementAccountError(message: failure.message)),
          (account) {
        transfernceResult.fold(
            (failure) => emit(StatementAccountError(message: failure.message)),
            (transferences) => emit(StatementAccountSuccess(
                account: account, transferences: transferences)));
      });
    });
  }
}
