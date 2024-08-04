import 'package:dartz/dartz.dart';
import 'package:fresh_start/core/error/failures.dart';
import 'package:fresh_start/features/transferences/data/model/transference_model.dart';
import 'package:fresh_start/features/transferences/data/model/transference_specific_model.dart';

abstract class TransferenceRepository {
  Future<Either<Failure, List<TransferenceModel>>> getTransferences();
  Future<Either<Failure, TransferenceSpecificModel>> getTransference(int id);
}