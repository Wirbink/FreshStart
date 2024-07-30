import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];

  get message => null;
}

class UnauthorizedFailure extends Failure {
  final String additionalMessage;

  UnauthorizedFailure(this.additionalMessage);

  @override
  String get message => 'Unauthorized: $additionalMessage';
}

class ValidationFailure extends Failure {
  final List<dynamic> errors;

  ValidationFailure(this.errors);

  @override
  List<Object> get props => [errors];

  List get errorMessages => errors.map((e) => e['constraints'].values.join(', ')).toList();
}


class UserCreationFailure extends Failure {
  @override
  String get message => 'User Creation Failure: Please try again later.';
}

class ServerFailure extends Failure {
  @override
  String get message => 'Server Failure: Please try again later.';
}

class ConnectivityFailure extends Failure {
  @override
  String get message => 'ConnectivityFailure: Connect to Internet';
}