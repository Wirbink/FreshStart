import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/Register/register_event.dart';
import 'package:fresh_start/core/presentation/bloc/Register/register_state.dart';
import 'package:fresh_start/domain/usecases/Auth/register_data.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterData submitRegister;

  RegisterBloc(this.submitRegister) : super(RegisterInitial()) {
    on<SubmitRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        await submitRegister(event.register);
        emit(RegisterSuccess());
      } catch (e) {
        emit(RegisterError('Failed to submit Register'));
      }
    });
  }
}



// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fresh_start/core/presentation/bloc/Register/register_event.dart';
// import 'package:fresh_start/core/presentation/bloc/Register/register_state.dart';
// import 'package:fresh_start/domain/usecases/Login/register_data.dart';

// class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
//   final RegisterData registerData;

//   RegisterBloc(this.registerData)
//   : super(const RegisterState(
//     name: '', lastname: '', email: '', rfc: '', phone: '', password: '', country: '', acceptedTerms: false
//   )){
//     on<LoadRegisterDataEvent>((event, emit) async {
//       final register = await registerData();
//       emit(RegisterState.fromModel(register));
//     });

//     on<NameChanged>((event, emit) {
//       emit(state.copyWith(
//         name: event.name, isValid: _vadilateRegister()
//       ));
//     });

//     on<LastNameChanged>((event, emit) {
//       emit(state.copyWith(
//         lastname: event.lastname, isValid: _vadilateRegister()
//       ));
//     });

//     on<EmailChanged>((event, emit) {
//       emit(state.copyWith(
//         email: event.email, isValid: _vadilateRegister()
//       ));
//     });

//     on<RfcChanged>((event, emit) {
//       emit(state.copyWith(
//         rfc: event.rfc, isValid: _vadilateRegister()
//       ));
//     });

//     on<PhoneChanged>((event, emit) {
//       emit(state.copyWith(
//         phone: event.phone, isValid: _vadilateRegister()
//       ));
//     });

//     on<PasswordChanged>((event, emit) {
//       emit(state.copyWith(
//         password: event.password, isValid: _vadilateRegister()
//       ));
//     });

//     on<CountryChanged>((event, emit) {
//       emit(state.copyWith(
//         country: event.country, isValid: _vadilateRegister()
//       ));
//     });

//     on<AcceptedTermsChanged>((event, emit) {
//       emit(state.copyWith(
//         acceptedTerms: event.acceptedTerms, isValid: _vadilateRegister()
//       ));
//     });
//   }

//   bool _vadilateRegister() {
//       final model = state;
//       return model.name.isEmpty &&
//       model.lastname.isEmpty &&
//       model.email.isEmpty &&
//       model.rfc.isEmpty &&
//       model.phone.isEmpty &&
//       model.country.isEmpty &&
//       model.acceptedTerms == null;
//     }
// }