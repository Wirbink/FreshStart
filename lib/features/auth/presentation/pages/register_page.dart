import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/old%20widgets/divider_widget.dart';
import 'package:fresh_start/core/presentation/old%20widgets/general_button.dart';
import 'package:fresh_start/core/services/shared_preferences_service.dart';
import 'package:fresh_start/core/utils/snackbar_utils.dart';
import 'package:fresh_start/core/utils/string_utils.dart';
import 'package:fresh_start/core/utils/validators.dart';
import 'package:fresh_start/features/auth/data/models/register_model.dart';
import 'package:fresh_start/features/auth/data/repositories/register_repository_impl.dart';
import 'package:fresh_start/features/auth/domain/usecases/register_usecase.dart';
import 'package:fresh_start/features/auth/presentation/blocs/register_bloc/register_bloc.dart';
import 'package:fresh_start/features/auth/presentation/pages/login_page.dart';
import 'package:fresh_start/features/auth/presentation/widgets/password_field.dart';
import 'package:fresh_start/shared/presentation/utils/navigation.dart';
import 'package:fresh_start/styles.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //TextControllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController rfcController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController idBankController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final sharedPreferencesService = SharedPreferencesService();
    final connectivity = Connectivity();
    final registerRepository = RegisterRepositoryImpl(
        sharedPreferencesService: sharedPreferencesService,
        connectivity: connectivity);
    final registerUsecase = RegisterUsecase(registerRepository);
    final registerBloc = RegisterBloc(registerUsecase: registerUsecase);

    return Scaffold(
      body: BlocProvider(
        create: (context) => registerBloc,
        child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterError) {
              showCustomSnackBar(context, capitalizeFirstLetter(state.message));
            } else if (state is RegisterSuccess) {
              navigateToReplacement(context, const LoginPage());
            }
          },
          child: BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              return buildRegisterView(context, state);
            },
          ),
        ),
      ),
    );
  }

  Widget buildRegisterView(BuildContext context, RegisterState state) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/LoginFreshBank.png'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.3),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.1, vertical: 20.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: colorPanel, borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                      key: _key,
                      child: Column(
                        children: [
                          const Text(
                            "Registro",
                            style: TextStyle(
                                fontFamily: 'MarkPro',
                                fontWeight: FontWeight.w900,
                                fontSize: 30.0),
                          ),
                          const SizedBox(height: 24.0),
                          TextFormField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Nombre(s)',
                              suffixIcon: Icon(Icons.person),
                            ),
                            validator: Validators.validateName,
                          ),
                          const SizedBox(height: 14.0),
                          TextFormField(
                            controller: lastnameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Apellidos',
                              suffixIcon: Icon(Icons.person),
                            ),
                            validator: Validators.validateLastName,
                          ),
                          const SizedBox(height: 14.0),
                          TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              suffixIcon: Icon(Icons.email),
                            ),
                            validator: Validators.validateEmail,
                          ),
                          const SizedBox(height: 14.0),
                          PasswordField(
                            validator: Validators.validatePassword,
                            controller: passwordController,
                          ),
                          const SizedBox(height: 14.0),
                          TextFormField(
                            controller: phoneController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Teléfono',
                              suffixIcon: Icon(Icons.phone),
                            ),
                            validator: Validators.phoneNumber,
                          ),
                          const SizedBox(height: 14.0),
                          TextFormField(
                            controller: rfcController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'RFC',
                                suffixIcon: Icon(Icons.phone)),
                            validator: Validators.validateRFC,
                          ),
                          const SizedBox(height: 24.0),
                          const Text(
                            "TÉRMINOS Y CONDICIONES",
                            style: TextStyle(
                                fontFamily: 'MarkPro',
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          const SizedBox(height: 24.0),
                          Center(
                            child: GestureDetector(
                              child: GeneralButtonWidget(
                                text: "Registrarse",
                                onPressed: () {
                                  final user = RegisterModel(
                                    name: nameController.text,
                                    lastname: lastnameController.text,
                                    email: emailController.text,
                                    rfc: rfcController.text,
                                    phone: phoneController.text,
                                    password: passwordController.text,
                                    id_bank: 6,
                                  );
                                  BlocProvider.of<RegisterBloc>(context)
                                      .add(SubmitRegisterEvent(register: user));
                                },
                                isLoading: state is RegisterLoading,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          DividerWidget(),
                          const SizedBox(height: 8.0),
                          Center(
                            child: GeneralButtonWidget(
                              text: "Iniciar Sesión",
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                              },
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
