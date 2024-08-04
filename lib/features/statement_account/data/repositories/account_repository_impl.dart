import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fresh_start/core/error/failures.dart';
import 'package:fresh_start/core/network/dio_client.dart';
import 'package:fresh_start/core/network/network_info.dart';
import 'package:fresh_start/core/network/network_info_impl.dart';
import 'package:fresh_start/features/statement_account/data/models/account_model.dart';
import 'package:fresh_start/features/statement_account/domain/repositories/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  final Connectivity connectivity;
  final NetworkInfo networkInfo;

  AccountRepositoryImpl({required this.connectivity})
      : networkInfo = NetworkInfoImpl(connectivity);

  @override
  Future<Either<Failure, AccountModel>> getAccount() async {
    if (await networkInfo.isConnected) {
      try {
        final dio = await DioClient.getInstance();
        final response = await dio.get('/accounts/me');

        if (response.statusCode == 200) {
          return Right(AccountModel.fromJson(response.data['data']));
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
