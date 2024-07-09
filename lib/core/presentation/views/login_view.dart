import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/Login/login_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/Login/login_event.dart';
import 'package:fresh_start/core/presentation/bloc/Login/login_state.dart';
import 'package:fresh_start/core/presentation/views/home_view.dart';
import 'package:fresh_start/core/presentation/views/register_view.dart';
import 'package:fresh_start/core/presentation/widgets/general_button.dart';
import 'package:fresh_start/data/repositories/Auth/login_repository_impl.dart';
import 'package:fresh_start/domain/usecases/Login/login_data.dart';
import 'package:fresh_start/styles.dart';
import 'package:local_auth/local_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _auth() async {
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticate(
        localizedReason: "Autentícate para acceder",
        options: const AuthenticationOptions(
            stickyAuth: true, useErrorDialogs: true),
      );
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

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final loginRepository = LoginRepositoryImpl();
    final loginData = LoginData(loginRepository);

    return Scaffold(
        body: BlocProvider(
      create: (context) => LoginBloc(loginData),
      child: SingleChildScrollView(
        child: Container(
          height: screenHeight,
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
                    color: colorPanel,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          if (state is LoginInitial) {
                            return buildForm(context);
                          } else if (state is LoginLoading) {
                            return const CircularProgressIndicator();
                          } else if (state is LoginSuccess) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeView()));
                            return const Text('Sucess');
                          } else if (state is LoginError) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(state.message),
                                const SizedBox(height: 16),
                                buildForm(context),
                              ],
                            );
                          } else {
                            return Container();
                          }
                        },
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
                            GestureDetector(
                              onTap: _auth,
                              child: const GeneralButtonWidget(
                                  text: 'Iniciar Sesión'),
                            ),
                            const SizedBox(height: 35.0),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterView()));
                              },
                              child: const GeneralButtonWidget(
                                  text: 'Registrarse'),
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget buildForm(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Correo',
            suffixIcon: Icon(Icons.email),
          ),
        ),
        const SizedBox(height: 20.0),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Contraseña',
            suffixIcon: Icon(Icons.visibility_off),
          ),
        ),
      ],
    );
  }
}
