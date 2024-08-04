import 'package:dartz/dartz.dart';
import 'package:fresh_start/core/error/failures.dart';
import 'package:fresh_start/core/usecases/usecase.dart';
import 'package:fresh_start/features/transferences/data/model/transference_model.dart';
import 'package:fresh_start/features/transferences/domain/repositories/transference_repository.dart';

class TransferencesUseCase implements UseCase<List<TransferenceModel>, NoParams> {
  final TransferenceRepository repository;

  TransferencesUseCase(this.repository);

  @override
  Future<Either<Failure, List<TransferenceModel>>> call(NoParams params) async {
    return await repository.getTransferences();
  }
}