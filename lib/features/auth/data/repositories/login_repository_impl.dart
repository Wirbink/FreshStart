import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fresh_start/core/error/failures.dart';
import 'package:fresh_start/core/network/dio_client.dart';
import 'package:fresh_start/core/network/network_info.dart';
import 'package:fresh_start/core/network/network_info_impl.dart';
import 'package:fresh_start/core/services/shared_preferences_service.dart';
import 'package:fresh_start/features/auth/data/models/login_model.dart';
import 'package:fresh_start/features/auth/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final SharedPreferencesService sharedPreferencesService;
  final Connectivity connectivity;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl({
    required this.sharedPreferencesService,
    required this.connectivity,
  }) : networkInfo = NetworkInfoImpl(connectivity);

  @override
  Future<Either<Failure, void>> loginUser(LoginModel login) async {
    if (await networkInfo.isConnected) {
      try {
        final dio = await DioClient.getInstance();
        final response = await dio.post('/auth/login', data: login.toJson());

        if (response.statusCode == 200) {
          final token = response.data['access_token'];
          await sharedPreferencesService.setAuthToken(token);
          return const Right(null);
        } else if (response.statusCode == 401) {
          return Left(UnauthorizedFailure(response.data['message']));
        } else {
          return Left(ServerFailure());
        }
      } on DioException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ConnectivityFailure());
    }
  }

  @override
  Future<void> logout() async {
    await sharedPreferencesService.removeAuthToken();
  }
}
