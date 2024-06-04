import 'package:fresh_start/domain/repositories/recharge_repository.dart';
import 'package:fresh_start/domain/models/Recharges/rechargesdata.dart';

class Load_rechargesdata {
  final RechargeRepository repository;

  Load_rechargesdata(this.repository);

  Future<RechargeModel> call() async {
    final form_repository_impl = await repository.loadFormData();

    if(form_repository_impl.phoneNumber.isEmpty) {
        throw Exception("Phone cannot be empty");
    }
    if(form_repository_impl.payWith.isEmpty) {
        throw Exception("Pay cannot be empty");
    }
    if(form_repository_impl.rechargeType.isEmpty) {
        throw Exception("Recharge cannot be empty");
    }
    if(form_repository_impl.sentAmount.isEmpty) {
        throw Exception("Amount cannot be empty");
    }

    return form_repository_impl;

  }
}