import 'package:fresh_start/domain/models/CoDi/codi_model.dart';

abstract class CodiRepository {
  Future<CodiModel> loadCodiData();
}