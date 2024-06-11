import 'package:equatable/equatable.dart';
// import 'package:aplicaciones_moviles_app/domain/models/form_model.dart';
import 'package:fresh_start/domain/models/Recharges/rechargesdata.dart';

class RechargesdataState extends Equatable {
  final int phoneNumber;
  final String payWith;
  final String rechargeType;
  final double? sentAmount;
  final bool isValid;

  const RechargesdataState(
    this.isValid, {
    this.phoneNumber = 0,
    this.payWith = '',
    this.rechargeType = '',
    this.sentAmount,
  });

  factory RechargesdataState.fromModel(RechargeModel model) {
    return RechargesdataState(
      true, // Debes proporcionar un valor para isValid
      phoneNumber: model.phoneNumber,
      payWith: model.payWith,
      rechargeType: model.rechargeType,
      sentAmount: model.sentAmount,
    );
  }

  RechargesdataState copyWith({
    int? phoneNumber, 
    String? payWith,
    String? rechargeType,
    double? sentAmount,
    bool? isValid,
  }) {
    return RechargesdataState(
      isValid ?? this.isValid, 
      phoneNumber: phoneNumber ?? this.phoneNumber,
      payWith: payWith ?? this.payWith,
      rechargeType: rechargeType ?? this.rechargeType,
      sentAmount: sentAmount ?? this.sentAmount,
    );
  }

  @override
  List<Object?> get props => [
        phoneNumber,
        payWith,
        rechargeType,
        sentAmount,
        isValid,
      ];
}
