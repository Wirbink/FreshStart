
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/transfer_event.dart';
import 'package:fresh_start/core/presentation/bloc/transfer_state.dart';
import 'package:fresh_start/domain/usecases/NationalTransfer/send_model_data.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  final SendModelData sendModelData;

  TransferBloc(this.sendModelData)
      : super(const TransferState(
            nameCard: '', adresseeName: '', clabe: 0, amount: 0)) {
    on<LoadTransfer>((event, emit) async {
      final transferData = await sendModelData();
      emit(TransferState.fromModel(transferData));
    });

    on<AdresseeNameChanged>((event, emit) {
      emit(state.copyWith(
          adresseeName: event.adresseeName, isValid: _validateForm()));
    });
    on<ClabeChanged>((event, emit) {
      emit(state.copyWith(clabe: event.clabe, isValid: _validateForm()));
    });
    on<AmountChanged>((event, emit) {
      emit(state.copyWith(amount: event.amount, isValid: _validateForm()));
    });
    on<NameCardChanged>((event, emit) {
      emit(state.copyWith(nameCard: event.nameCard, isValid: _validateForm()));
    });
    on<TransferSubmitted>((event, emit) {
      if (state.isValid) {}
    });
  }

  bool _validateForm() {
    final model = state;
    return model.adresseeName.isNotEmpty &&
        model.clabe != null &&
        model.amount != null &&
        model.nameCard.isNotEmpty;
  }
}
