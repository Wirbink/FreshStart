import 'package:equatable/equatable.dart';
import 'package:fresh_start/domain/models/send_money_model.dart';

class TransferState extends Equatable {
  final String nameCard;
  final String adresseeName;
  final int clabe;
  final double amount;
  final bool isValid;

  const TransferState({
    required this.nameCard,
    required this.adresseeName,
    required this.clabe,
    required this.amount,
    this.isValid = false,
  });

  factory TransferState.fromModel(SendMoneyModel model) {
    return TransferState(
      nameCard: model.nameCard,
      adresseeName: model.adresseeName,
      clabe: model.clabe,
      amount: model.amount,
      isValid: true,
    );
  }

  TransferState copyWith({
    String? nameCard,
    String? adresseeName,
    int? clabe,
    double? amount,
    bool? isValid,
  }) {
    return TransferState(
      nameCard: nameCard ?? this.nameCard,
      adresseeName: adresseeName ?? this.adresseeName,
      clabe: clabe ?? this.clabe,
      amount: amount ?? this.amount,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        nameCard,
        adresseeName,
        clabe,
        amount,
        isValid,
      ];
}
