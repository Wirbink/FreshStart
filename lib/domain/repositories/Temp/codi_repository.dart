import 'package:fresh_start/domain/models/codi_model.dart';

abstract class CodiRepository{
  Future<CodiModel> loadCodiData();
}