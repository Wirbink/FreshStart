import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/StatementAccount/specific_transfer_detail_event.dart';
import 'package:fresh_start/core/presentation/bloc/StatementAccount/specific_transfer_detail_state.dart';
import 'package:fresh_start/domain/usecases/Transfers/specific_transfer_detail_data.dart';

class SpecificTransferDetailBloc extends Bloc<SpecificTransferDetailEvent, SpecificTransferDetailState> {
  final SpecificTransferDetailData getTransfer;
  final int id;

  SpecificTransferDetailBloc(this.getTransfer, this.id) : super(Empty()) {
    on<GetSpecificTransferDetailEvent>((event, emit) async {
      emit(Loading());
      try {
        final transfer = await getTransfer();
        emit(Success(transfer));
      } catch (e) {
        emit(const Error(message: 'Failed to get trasnfer'));
      }
    });
  }
}