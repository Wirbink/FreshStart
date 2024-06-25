import 'package:equatable/equatable.dart';
import 'package:fresh_start/domain/models/Transfers/contact_model.dart';

class TransfersContactsState extends Equatable {
  final List<ContactModel> contacts;

  TransfersContactsState({
    this.contacts = const []
  });

  factory TransfersContactsState.fromModel(List<ContactModel> contacts){
    return TransfersContactsState( contacts: contacts);
  }

  TransfersContactsState copyWith({
    List<ContactModel>? contacts,
    bool? isValid
  }) {
    return TransfersContactsState(
      contacts: contacts ?? this.contacts
    );
  }

  @override
  List<Object> get props => [
    contacts
  ];
}
