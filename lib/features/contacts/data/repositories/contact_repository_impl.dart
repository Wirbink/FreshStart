import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fresh_start/core/error/failures.dart';
import 'package:fresh_start/core/network/dio_client.dart';
import 'package:fresh_start/core/network/network_info.dart';
import 'package:fresh_start/core/network/network_info_impl.dart';
import 'package:fresh_start/features/contacts/data/model/contact_model.dart';
import 'package:fresh_start/features/contacts/data/model/create_contact_model.dart';
import 'package:fresh_start/features/contacts/domain/repositories/contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository {
  final Connectivity connectivity;
  final NetworkInfo networkInfo;

  ContactRepositoryImpl({
    required this.connectivity,
  }) : networkInfo = NetworkInfoImpl(connectivity);

  @override
  Future<Either<Failure, void>> createContact(
      CreateContactModel contact) async {
    if (await networkInfo.isConnected) {
      try {
        final dio = await DioClient.getInstance();
        final response = await dio.post('/contacts', data: contact.toJson());

        if (response.statusCode == 201) {
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
  Future<Either<Failure, List<ContactModel>>> getContacts() async {
    if (await networkInfo.isConnected) {
      try {
        final dio = await DioClient.getInstance();
        final response = await dio.get('/contacts');
        print(response.data);
        if (response.statusCode == 200) {
          final List<dynamic> data = response.data['data'];
          final List<ContactModel> contacts =
              data.map((jsonItem) => ContactModel.fromJson(jsonItem)).toList();

          return Right(contacts);
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
