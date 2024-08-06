import 'package:dartz/dartz.dart';
import 'package:fresh_start/core/error/failures.dart';
import 'package:fresh_start/features/contacts/data/model/contact_model.dart';
import 'package:fresh_start/features/contacts/data/model/create_contact_model.dart';

abstract class ContactRepository {
  Future<Either<Failure, void>> createContact(CreateContactModel contact);
  Future<Either<Failure, List<ContactModel>>> getContacts();
}
