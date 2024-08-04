import 'package:dartz/dartz.dart';
import 'package:fresh_start/core/error/failures.dart';
import 'package:fresh_start/core/usecases/usecase.dart';
import 'package:fresh_start/features/transferences/data/model/transference_specific_model.dart';
import 'package:fresh_start/features/transferences/domain/repositories/transference_repository.dart';

class TransferencesSpecificUseCase implements UseCase<TransferenceSpecificModel, int> {
  final TransferenceRepository repository;

  TransferencesSpecificUseCase(this.repository);

  @override
  Future<Either<Failure, TransferenceSpecificModel>> call(int id) async {
    return await repository.getTransference(id);
  }
}