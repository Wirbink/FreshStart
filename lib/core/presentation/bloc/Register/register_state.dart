import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterError extends RegisterState {
  final String message;

  const RegisterError({required this.message});

  @override 
  List<Object> get props => [message];
}


// import 'package:equatable/equatable.dart';
// import 'package:fresh_start/domain/models/Auth/register_model.dart';

// class RegisterState extends Equatable {
//   final String name;
//   final String lastname;
//   final String email;
//   final String rfc;
//   final String phone;
//   final String password;
//   final String country;
//   final bool acceptedTerms;

//   const RegisterState(
//     {this.name = '', this.lastname = '', this.email = '', this.rfc = '', this.phone = '', this.password = '', this.country = '', this.acceptedTerms = false}
//   );

//   factory RegisterState.fromModel(RegisterModel model) {
//     return RegisterState(
//         name: model.name, lastname: model.lastname, email: model.email, rfc: model.rfc, phone: model.phone, password: model.password, country: model.country, acceptedTerms: model.acceptedTerms
//     );
//   }

//   RegisterState copyWith({
//   String? name,
//   String? lastname,
//   String? email,
//   String? rfc,
//   String? phone,
//   String? password,
//   String? country,
//   bool? acceptedTerms,
//   bool? isValid,
//   }) {
//     return RegisterState(
//        name: name ?? this.name,
//        lastname: lastname ?? this.lastname,
//        email: email ?? this.email,
//        rfc: rfc ?? this.rfc, 
//        phone: phone ?? this.phone,
//        password: password ?? this.password,
//        country: country ?? this.country,
//        acceptedTerms: acceptedTerms ?? this.acceptedTerms);
//   }
//     @override
//   List<Object> get props => [name, lastname, email, rfc, phone, password, country, acceptedTerms];

// }