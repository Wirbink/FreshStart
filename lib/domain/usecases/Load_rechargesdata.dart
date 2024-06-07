import 'package:fresh_start/domain/repositories/recharge_repository.dart';
import 'package:fresh_start/domain/models/Recharges/rechargesdata.dart';

class LoadRechargesData {
  final RechargeRepository repository;

  LoadRechargesData(this.repository);

  Future<RechargeModel> call() async {
    final form_repository_impl = await repository.loadFormData();

    if(form_repository_impl.phoneNumber == null) {
        throw Exception("Phone cannot be empty");
    }
    if(form_repository_impl.payWith.isEmpty) {
        throw Exception("Pay cannot be empty");
    }
    if(form_repository_impl.rechargeType.isEmpty) {
        throw Exception("Recharge cannot be empty");
    }
    if(form_repository_impl.sentAmount == null) {
        throw Exception("Amount cannot be empty");
    }

    return form_repository_impl;

  }
}