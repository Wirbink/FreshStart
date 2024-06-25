import 'package:equatable/equatable.dart';
import 'package:fresh_start/domain/models/Transfers/transfers_model.dart';

class AddNewContactState extends Equatable {
  final String cardNumber;

  const AddNewContactState({this.cardNumber = ''});

  factory AddNewContactState.fromModel(TransfersModel model){
    return AddNewContactState(
      cardNumber: model.cardNumber
    );
  }

  AddNewContactState copyWith({
    String? cardNumber,
    bool? isValid
  }) {
    return AddNewContactState(
      cardNumber: cardNumber ?? this.cardNumber
    );
  }

  @override
  List<Object> get props => [cardNumber];
}