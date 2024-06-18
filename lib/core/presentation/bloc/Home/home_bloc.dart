import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/Home/home_event.dart';
import 'package:fresh_start/core/presentation/bloc/Home/home_state.dart';
import 'package:fresh_start/domain/usecases/CashExpress/cash_express_data.dart';
import 'package:fresh_start/domain/usecases/Transfers/contact_data.dart';

class HomeBLoc extends Bloc<HomeEvent, HomeState> {
  final CashExpressData cashExpressData;
  final ContactData contactData;

  HomeBLoc(this.cashExpressData, this.contactData) : super(const HomeState( sender: '', balance: 0.0, contacts: [])) {
    on<LoadHomeDataEvent>((event, emit) async {
      final cashExpress = await cashExpressData();
      final contact = await contactData();

      emit(HomeState.fromModel(cashExpress, contact));
    });

    on<SenderChanged>((event, emit) {
      emit(state.copyWith(
        sender: event.sender, isValid: _validateHome()
      ));
    });

    on<BalanceChanged>((event, emit) {
      emit(state.copyWith(
        balance: event.balance, isValid: _validateHome()
      ));
    });

    on<ContactChanged>((event, emit) {
      emit(state.copyWith(
        contacts: event.contacts, isValid: _validateHome()
      ));
    });
  }
  
  bool _validateHome() {
    final model = state;
    return model.sender.isNotEmpty &&
    model.balance != null &&
    model.contacts != null;
  }
}