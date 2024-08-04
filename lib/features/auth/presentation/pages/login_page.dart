import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/views/home_view.dart';
import 'package:fresh_start/core/presentation/old%20widgets/general_button.dart';
import 'package:fresh_start/core/services/shared_preferences_service.dart';
import 'package:fresh_start/core/utils/snackbar_utils.dart';
import 'package:fresh_start/core/utils/string_utils.dart';
import 'package:fresh_start/core/utils/validators.dart';
import 'package:fresh_start/features/auth/data/models/login_model.dart';
import 'package:fresh_start/features/auth/data/repositories/login_repository_impl.dart';
import 'package:fresh_start/features/auth/domain/usecases/login_usecase.dart';
import 'package:fresh_start/features/auth/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:fresh_start/features/auth/presentation/pages/register_page.dart';
import 'package:fresh_start/features/auth/presentation/widgets/password_field.dart';
import 'package:fresh_start/features/home/presentation/pages/home_page.dart';
import 'package:fresh_start/styles.dart';
import 'package:local_auth/local_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    phoneController.addListener(_validateInputs);
    passwordController.addListener(_validateInputs);
  }

  void _validateInputs() {
    setState(() {
      isButtonEnabled =
          phoneController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sharedPreferencesService = SharedPreferencesService();
    final connectivity = Connectivity();
    final loginRepository = LoginRepositoryImpl(
        sharedPreferencesService: sharedPreferencesService,
        connectivity: connectivity);
    final loginUser = LoginUseCase(loginRepository);
    final loginBloc = LoginBloc(loginUser: loginUser);

    return Scaffold(
      body: BlocProvider(
          create: (context) => loginBloc,
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginError) {
                showCustomSnackBar(
                    context, capitalizeFirstLetter(state.message));
              } else if (state is LoginSuccess) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                        builder: (context) => const HomePage()));
              }
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return buildLogin(context, state);
              },
            ),
          )),
    );
  }

  Widget buildLogin(BuildContext context, LoginState state) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/LoginFreshBank.png'),
              fit: BoxFit.cover),
        ),
        child: Center(
            child: Column(
          children: [
            SizedBox(height: screenHeight * 0.3),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.1, vertical: 20.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: colorPanel, borderRadius: BorderRadius.circular(20.0)),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        TextFormField(
                          controller: phoneController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Número de telefono',
                            suffixIcon: Icon(Icons.phone),
                          ),
                          validator: Validators.phoneNumber,
                        ),
                        const SizedBox(height: 20.0),
                        PasswordField(
                          validator: Validators.validatePassword,
                          controller: passwordController,
                        ),
                        const SizedBox(height: 30.0),
                        Center(
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  '¿Olvidaste tu contraseña?',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: colorPrimaryComplementary,
                                  ),
                                ),
                              ),
                              GeneralButtonWidget(
                                text: 'Iniciar Sesión',
                                onPressed: () {
                                  if (_key.currentState!.validate()) {
                                    final user = LoginModel(
                                        phone: phoneController.text,
                                        password: passwordController.text);
                                    BlocProvider.of<LoginBloc>(context)
                                        .add(SubmitLoginEvent(login: user));
                                  }
                                },
                                isEnabled: isButtonEnabled,
                                isLoading: state is LoginLoading,
                              ),
                              const SizedBox(height: 35.0),
                              GeneralButtonWidget(
                                text: 'Registrarse',
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterPage()));
                                },
                                isEnabled: true,
                              ),
                              const Text("O"),
                              IconButton(
                                onPressed: _auth,
                                icon: const Icon(Icons.fingerprint),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  Future<void> _auth() async {
    bool authenticated = false;

    try {
      authenticated = await _localAuthentication.authenticate(
          localizedReason: "Autentícate para acceder",
          options: const AuthenticationOptions(
              stickyAuth: true, useErrorDialogs: true));
    } catch (e) {
      print(e);
    }

    if (authenticated) {
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const HomeView(),
        ),
      );
    } else {
      print("Fallo auth");
    }
  }
}
