// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fresh_start/core/presentation/bloc/Register/register_bloc.dart';
// import 'package:fresh_start/core/presentation/bloc/Register/register_event.dart';
// import 'package:fresh_start/core/presentation/bloc/Register/register_state.dart';
// import 'package:fresh_start/core/presentation/widgets/divider_widget.dart';
// import 'package:fresh_start/core/presentation/widgets/general_button.dart';
// import 'package:fresh_start/core/presentation/widgets/input_text.dart';
// import 'package:fresh_start/data/repositories/Auth/register_repository_impl.dart';
// import 'package:fresh_start/domain/models/Auth/register_model.dart';
// import 'package:fresh_start/domain/usecases/Auth/register_data.dart';
// import 'package:fresh_start/styles.dart';

// class RegisterView extends StatefulWidget {
//   RegisterView({super.key});

//   @override
//   _RegisterViewState createState() => _RegisterViewState();
// }

// class _RegisterViewState extends State<RegisterView> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController lastnameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController rfcController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController idBankController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;

//     final userRepository = RegisterRepositoryImpl();
//     final registerData = RegisterData(userRepository);

//     return Scaffold(
//       body: BlocProvider(
//         create: (context) => RegisterBloc(registerData),
//         child: SingleChildScrollView(
//           child: Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('assets/images/LoginFreshBank.png'),
//                   fit: BoxFit.cover),
//             ),
//             child: Column(
//               children: [
//                 SizedBox(height: screenHeight * 0.3),
//                 Container(
//                   margin: EdgeInsets.symmetric(
//                       horizontal: screenWidth * 0.1, vertical: 20.0),
//                   padding: const EdgeInsets.all(20.0),
//                   decoration: BoxDecoration(
//                     color: colorPanel,
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       BlocBuilder<RegisterBloc, RegisterState>(
//                         builder: (context, state) {
//                           if (state is RegisterInitial) {
//                             return buildForm(context);
//                           } else if (state is RegisterLoading) {
//                             return const CircularProgressIndicator();
//                           } else if (state is RegisterSuccess) {
//                             return const Text(
//                                 'Register data submitted successfully');
//                           } else if (state is RegisterError) {
//                             print("Hola entre al error");
//                             return Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(state.message),
//                                 const SizedBox(height: 16),
//                                 buildForm(context),
//                               ],
//                             );
//                           } else {
//                             return Container();
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildForm(BuildContext context) {
//     return 
//   }
// }
