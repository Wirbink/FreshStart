import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fresh_start/core/error/failures.dart';
import 'package:fresh_start/core/network/dio_client.dart';
import 'package:fresh_start/core/network/network_info.dart';
import 'package:fresh_start/core/network/network_info_impl.dart';
import 'package:fresh_start/features/transferences/data/model/transference_model.dart';
import 'package:fresh_start/features/transferences/data/model/transference_specific_model.dart';
import 'package:fresh_start/features/transferences/domain/repositories/transference_repository.dart';

class TransferenceRepositoryImpl implements TransferenceRepository {
  final Connectivity connectivity;
  final NetworkInfo networkInfo;

  TransferenceRepositoryImpl({required this.connectivity})
      : networkInfo = NetworkInfoImpl(connectivity);

  @override
  Future<Either<Failure, List<TransferenceModel>>> getTransferences() async {
    if (await networkInfo.isConnected) {
      try {
        final dio = await DioClient.getInstance();
        final response = await dio.get('/transferences');

        if (response.statusCode == 200) {
          final List<dynamic> data = response.data['data'];

          final List<TransferenceModel> transferences = data
              .map((jsonItem) => TransferenceModel.fromJson(jsonItem))
              .toList();

          return Right(transferences);
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
  Future<Either<Failure, TransferenceSpecificModel>> getTransference(
      int id) async {
    if (await networkInfo.isConnected) {
      try {
        final dio = await DioClient.getInstance();
        final response = await dio.get('/transferences/$id');

        if (response.statusCode == 200) {
          return Right(
              TransferenceSpecificModel.fromJson(response.data['data']));
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
