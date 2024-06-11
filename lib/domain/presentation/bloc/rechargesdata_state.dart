import 'dart:ffi';

import 'package:equatable/equatable.dart';
// import 'package:aplicaciones_moviles_app/domain/models/form_model.dart';
import 'package:fresh_start/domain/models/Recharges/rechargesdata.dart';

class RechargesdataState extends Equatable {
  final Int phoneNumber;
  final String payWith;
  final String rechargeType;
  final double sentAmount;
  final bool isValid;

  const RechargesdataState({
    this.phoneNumber = '',
    this.payWith = '',
    this.rechargeType = '',
    this.sentAmount = '',
  });

  factory RechargesdataState.fromModel(RechargeModel model) {
    return RechargesdataState(
      phoneNumber: model.phoneNumber,
      payWith: model.payWith,
      rechargeType: model.rechargeType,
      sentAmount: model.sentAmount,
    );
  }

  RechargesdataState copyWith({
    Int? phoneNumber,
    String? payWith,
    String? rechargeType,
    Double? sentAmount,
  }) {
    return RechargesdataState(
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
      ];
}
