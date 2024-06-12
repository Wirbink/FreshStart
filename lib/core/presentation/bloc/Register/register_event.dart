import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class LoadRegisterDataEvent extends RegisterEvent{}

  class NameChanged extends RegisterEvent{
    final String name;

    const NameChanged(this.name);

    @override 
    List<Object> get props => [name];
  }

  class LastNameChanged extends RegisterEvent{
    final String lastname;

    const LastNameChanged(this.lastname);

    @override 
    List<Object> get props => [lastname];
  }

  class EmailChanged extends RegisterEvent{
    final String email;

    const EmailChanged(this.email);

    @override 
    List<Object> get props => [email];
  }

  class RfcChanged extends RegisterEvent{
    final String rfc;

    const RfcChanged(this.rfc);

    @override 
    List<Object> get props => [rfc];
  }

   class PhoneChanged extends RegisterEvent{
    final String phone;

    const PhoneChanged(this.phone);

    @override 
    List<Object> get props => [phone];
  }

  class PasswordChanged extends RegisterEvent{
    final String password;

    const PasswordChanged(this.password);

    @override 
    List<Object> get props => [password];
  }

  class CountryChanged extends RegisterEvent{
      final String country;

      const CountryChanged(this.country);

      @override 
      List<Object> get props => [country];
  }
  class AcceptedTermsChanged extends RegisterEvent{
    final bool acceptedTerms;

    const AcceptedTermsChanged(this.acceptedTerms);

    @override 
    List<Object> get props => [acceptedTerms];
  }

  class RegisterSubmitted extends RegisterEvent {}