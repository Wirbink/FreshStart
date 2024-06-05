import 'package:fresh_start/domain/models/amount_cash_express_model.dart';
import 'package:fresh_start/domain/repositories/amount_cash_express_repo.dart';


  class LoadAmountCash {
  final AmountCashExpressRepository repositories;

 LoadAmountCash (this.repositories);
    Future <AmountCashExpressModel> call () async {

   final amountCash = await  repositories.loadAmountCashExpressData();{


  if (amountCash.pay.isEmpty){
   throw Exception("cadena no vacía");
  }

if (amountCash.account.isEmpty){
   throw Exception("cadena válida");
}
if (amountCash.clabeDestination.isEven){
  throw Exception("18 dígitos");

}
if (amountCash.date.isEmpty){
  throw Exception("formato válido");
}

if (amountCash.hour.isEmpty){
    throw Exception("formato válido");
}
if (amountCash.withdrawalKey.isEmpty){
     throw Exception("cadena no vacía");
}

if (amountCash.securityCode.isEven){
       throw Exception("número entero válido");
}
if (amountCash.amount.isEven){
  throw Exception("mayor a 0 y menor o igual al saldo disponible");
}

}

return amountCash;
}


  }

