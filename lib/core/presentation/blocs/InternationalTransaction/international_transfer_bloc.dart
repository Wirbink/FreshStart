import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/blocs/InternationalTransaction/internantional_transfer_state.dart';
import 'package:fresh_start/core/presentation/blocs/InternationalTransaction/international_transfer_event.dart';
import 'package:fresh_start/domain/usecases/InternationalTransfer/international_transfer_data.dart' as usecase;


class InternationalTransferBloc extends Bloc<InternationalTransferEvent, InternationalTransferState> {
  final usecase.InternationalTransferData loadInternationalTransferData;

  InternationalTransferBloc(this.loadInternationalTransferData) : super(InternationalTransferState()) {
    on<InternationalTransferEvent>((event, emit) async {
      final transferData = await loadInternationalTransferData();
      emit(InternationalTransferState.fromModel(transferData));
    });

    on<TransactionDateChanged>(
      (event, emit) => emit(state.copyWith(transactionDate: event.transactionDate)),
    );
    on<SenderChanged>(
      (event, emit) => emit(state.copyWith(sender: event.sender)),
    );
    on<RecipientChanged>(
      (event, emit) => emit(state.copyWith(recipient: event.recipient)),
    );
    on<AmountChanged>(
      (event, emit) => emit(state.copyWith(amount: event.amount)),
    );
    on<ExchangeRateChanged>(
      (event, emit) => emit(state.copyWith(exchangeRate: event.exchangeRate)),
    );
    on<FeeChanged>(
      (event, emit) => emit(state.copyWith(fee: event.fee)),
    );
    on<ConceptChanged>(
      (event, emit) => emit(state.copyWith(concept: event.concept)),
    );
    
  }
}