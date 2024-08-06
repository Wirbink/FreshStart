import 'package:dartz/dartz.dart';
import 'package:fresh_start/core/error/failures.dart';
import 'package:fresh_start/core/usecases/usecase.dart';
import 'package:fresh_start/features/transferences/data/model/send_transferences_model.dart';
import 'package:fresh_start/features/transferences/domain/repositories/transference_repository.dart';

class SendTransferencesUseCase
    implements UseCase<void, SendTransferencesParams> {
  final TransferenceRepository repository;

  SendTransferencesUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(SendTransferencesParams params) async {
    return await repository.sendTransference(params.transference);
  }
}

class SendTransferencesParams {
  final SendTransferencesModel transference;

  SendTransferencesParams({required this.transference});
}
