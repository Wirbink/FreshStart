import 'package:dartz/dartz.dart';
import 'package:fresh_start/core/error/failures.dart';
import 'package:fresh_start/core/usecases/usecase.dart';
import 'package:fresh_start/features/contacts/data/model/create_contact_model.dart';
import 'package:fresh_start/features/contacts/domain/repositories/contact_repository.dart';

class CreateContactUseCase implements UseCase<void, CreateContactParams> {
  final ContactRepository repository;

  CreateContactUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(CreateContactParams params) async {
    return await repository.createContact(params.contact);
  }
}

class CreateContactParams {
  final CreateContactModel contact;

  CreateContactParams({required this.contact});
}
