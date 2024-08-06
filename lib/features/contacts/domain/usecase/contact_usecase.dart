import 'package:dartz/dartz.dart';
import 'package:fresh_start/core/error/failures.dart';
import 'package:fresh_start/core/usecases/usecase.dart';
import 'package:fresh_start/features/contacts/data/model/contact_model.dart';
import 'package:fresh_start/features/contacts/domain/repositories/contact_repository.dart';

class ContactUseCase implements UseCase<List<ContactModel>, NoParams> {
  final ContactRepository repository;

  ContactUseCase(this.repository);

  @override
  Future<Either<Failure, List<ContactModel>>> call(NoParams params) async {
    return await repository.getContacts();
  }
}