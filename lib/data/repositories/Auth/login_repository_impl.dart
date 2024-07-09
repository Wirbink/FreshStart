
import 'package:dio/dio.dart';
import 'package:fresh_start/domain/models/Auth/login_model.dart';
import 'package:fresh_start/domain/repositories/Auth/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepositoryImpl implements LoginRepository {
  final Dio _dio = Dio();

  @override
  Future<void> loginUser(LoginModel login) async {
    try {
      final response = await _dio.post('TODO: url', data: login.toJson());

      if(response.statusCode == 200) {
        String token = response.data['token'];
        await _saveToken(token); 
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to submit Register');
    }
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  // Future<LoginModel> loadLoginData() async {
  //   final response = await rootBundle.loadString('assets/json_data/Auth/login.json');
  //   final data = json.decode(response);
  //   print(data);
  //   return LoginModel.fromJson(data);
  // }
}
