import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/domain/usecases/Load_rechargesdata.dart' as usecase;
import 'package:fresh_start/domain/presentation/bloc/rechargesdata_event.dart';
import 'package:fresh_start/domain/presentation/bloc/rechargesdata_state.dart';
class RechargesdataBloc extends Bloc<RechargesdataEvent, RechargesdataState> {
  final usecase.Load_rechargesdata loadFormData;
//Load_rechargesdata
  RechargesdataBloc(this.loadFormData) : super(const RechargesdataState() ) {
    on<Load_rechargesdataEvent>((event, emit) async {
      final rechargesData = await loadFormData();
      emit(RechargesdataState.fromModel(rechargesData));
    });

 on<phoneNumberChanged>((event, emit) {
      emit(state.copyWith(phoneNumber: event.phoneNumber));
    });
    on<PayWithChanged>((event, emit) {
      emit(state.copyWith(payWith: event.payWith));
    });
    on<RechargeTypeChanged>((event, emit) {
      emit(state.copyWith(rechargeType: event.rechargeType));
    });
    on<SentAmountChanged>((event, emit) {
      emit(state.copyWith(sentAmount: event.sentAmount));
    });
    on<FormSubmitted>((event, emit) {
      if (state.isValid) {
        // Handle form submission logic
      }
    });
  }

  bool _validateForm() {
    return state.phoneNumber.isEven &&
        state.payWith.isNotEmpty &&
        state.rechargeType.isNotEmpty &&
        state.sentAmount!.isFinite;
  }
}

// DIO modulo de flutter
// introducion
// trata
// consiste
// pros y contras
// benecificios y limitaciones
// argumentar por que es mejor el otro modulo o libreria
