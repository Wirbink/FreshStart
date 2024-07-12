import 'package:dio/dio.dart';
import 'package:fresh_start/domain/models/Auth/register_model.dart';
import 'package:fresh_start/domain/repositories/Auth/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final Dio _dio = Dio();
  final String url = 'https://apimoviles-production.up.railway.app';

  @override
  Future<dynamic> submitUser(RegisterModel register) async {
    try {
      final response = await _dio.post('$url/users', data: register.toJson());
      return response;
    } catch (e) {
      print(e);
      throw Exception('Failed to submit Register');
    }
  }
}