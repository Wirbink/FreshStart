import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fresh_start/core/error/failures.dart';
import 'package:fresh_start/core/network/dio_client.dart';
import 'package:fresh_start/core/network/network_info.dart';
import 'package:fresh_start/core/network/network_info_impl.dart';
import 'package:fresh_start/core/services/shared_preferences_service.dart';
import 'package:fresh_start/features/auth/data/models/register_model.dart';
import 'package:fresh_start/features/auth/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final SharedPreferencesService sharedPreferencesService;
  final Connectivity connectivity;
  final NetworkInfo networkInfo;

  RegisterRepositoryImpl({
    required this.sharedPreferencesService,
    required this.connectivity
  }) : networkInfo = NetworkInfoImpl(connectivity);

  @override
  Future<Either<Failure, void>> createUser(RegisterModel register) async {
    if (await networkInfo.isConnected) {
      try {
        final dio = await DioClient.getInstance();
        final response = await dio.post('/users', data: register.toJson());

        if (response.statusCode != 201) {
          if (response.data['errors'] != null) {
            return Left(ValidationFailure(response.data['errors']));
          }
          return Left(UserCreationFailure());
        }

        return const Right(null);
      } on DioException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ConnectivityFailure());
    }
  }

  
}