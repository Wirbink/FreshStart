import 'package:fresh_start/domain/models/data_card_model.dart';
import 'package:fresh_start/domain/repositories/data_card_repo.dart';



class LoadCardData{
final DataCardRepository repositories;

LoadCardData (this.repositories);
Future <DataCardModel> call() async {

final DataCard = await repositories.loadDataCardData();{
  
if (DataCard.availableBalance == null){
  throw Exception("data ivalabalancer is equal null");
}

if (DataCard.cardNumbers.isEmpty){
  throw Exception("data numbers is equal null");
}

if(DataCard.cvv == null){
  throw Exception("data cvv is equal null");
}


if (DataCard.expiration.isEmpty){
  throw Exception("data expiration is equal null");
}


if (DataCard.availableBalance > 0){
  throw Exception("número mayor o igual a 0");
}

if (DataCard.cardNumbers.length > 18){
 throw Exception("cadena de números de tarjeta válida");

}

if (DataCard.cvv >= 3 && DataCard.cvv <= 4){

   throw Exception("número entero de 3 o 4 dígitos");
}

return DataCard;
  
}


}

}