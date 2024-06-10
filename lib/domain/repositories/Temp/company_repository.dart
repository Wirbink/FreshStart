import 'package:fresh_start/domain/models/Temp/company_model.dart';

abstract class CompanyRepository{
  Future<CompanyModel> loadCompanyData();
}