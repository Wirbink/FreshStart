import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fresh_start/core/error/failures.dart';
import 'package:fresh_start/core/network/dio_client.dart';
import 'package:fresh_start/core/network/network_info.dart';
import 'package:fresh_start/core/network/network_info_impl.dart';
import 'package:fresh_start/features/user/data/models/user_model.dart';
import 'package:fresh_start/features/user/data/models/user_update_model.dart';
import 'package:fresh_start/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final Connectivity connectivity;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({required this.connectivity})
      : networkInfo = NetworkInfoImpl(connectivity);

  @override
  Future<Either<Failure, UserModel>> getUser() async {
    if (await networkInfo.isConnected) {
      try {
        final dio = await DioClient.getInstance();
        final response = await dio.get('/users');

        if (response.statusCode == 200) {
          return Right(UserModel.fromJson(response.data['data']));
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
  Future<Either<Failure, void>> updateUser(UserUpdateModel user) async {
    if (await networkInfo.isConnected) {
      try {
        final dio = await DioClient.getInstance();
        final response = await dio.patch('/users', data: user.toJson());

        if (response.statusCode == 200) {
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
}
