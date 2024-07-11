import 'package:dio/dio.dart';
import 'package:fresh_start/domain/models/Transfers/transfers_registration.dart';
import 'package:fresh_start/domain/repositories/Transfers/transfers_list_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransfersRegistrationRepositoryImpl
    implements TransfersRegistrationRepository {
  final Dio _dio = Dio();

  final String url = 'apimoviles-production.up.railway.app';

  @override
  Future<List<TransfersRegistrationModel>?>
      loadTransfersRegistrationData() async {
    try {
      Future<String?> token = getToken();

      if (token == null) {
        throw Exception('No Authorized');
      }

      final response = await _dio.get('$url/transactions',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data as List<dynamic>;
        return jsonList
            .map((json) => TransfersRegistrationModel.fromJson(json))
            .toList();
      }

      if (response.statusCode == 401) {
        throw Exception('No Authorized');
      }

      if (response.statusCode == 500) {
        throw Exception('internal server error');
      }
    } on DioException catch (e) {
      print(e);
      throw Exception('Failed to get Transactions');
    }

    return null;
  }

  @override
  Future<TransfersRegistrationModel?> loadTransfer(int id) async {
    try {
      Future<String?> token = getToken();

      if (token == null) {
        throw Exception('No Authorized');
      }

      final response = await _dio.get('$url/transactions/$id',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      if (response.statusCode == 200) {
        return TransfersRegistrationModel.fromJson(response.data);
      }

      if (response.statusCode == 401) {
        throw Exception('No Authorized');
      }

      if (response.statusCode == 500) {
        throw Exception('internal server error');
      }
    } on DioException catch (e) {
      print('Error: $e');
      throw Exception('Failed to load Transfers');
    }

    return null;
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }
}
