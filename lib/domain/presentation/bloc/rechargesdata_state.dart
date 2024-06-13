import 'package:equatable/equatable.dart';
import 'package:fresh_start/domain/models/Recharges/rechargesdata.dart';

class RechargesdataState extends Equatable {
  final int phoneNumber;
  final String payWith;
  final String rechargeType;
  final double? sentAmount;
  final bool isValid;

  const RechargesdataState(
   {
    this.isValid = true,
    this.phoneNumber = 0,
    this.payWith = '',
    this.rechargeType = '',
    this.sentAmount,

  });

  factory RechargesdataState.fromModel(RechargeModel model) {
    return RechargesdataState(
     // Debes proporcionar un valor para isValid
      phoneNumber: model.phoneNumber,
      payWith: model.payWith,
      rechargeType: model.rechargeType,
      sentAmount: model.sentAmount,
      isValid: true,
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
      phoneNumber: phoneNumber ?? this.phoneNumber,
      payWith: payWith ?? this.payWith,
      rechargeType: rechargeType ?? this.rechargeType,
      sentAmount: sentAmount ?? this.sentAmount,
      isValid: isValid ?? this.isValid,
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
