import 'package:flutter/material.dart';
import 'package:fresh_start/core/presentation/views/home.dart';
import 'package:fresh_start/core/presentation/views/register_view.dart';
import 'package:fresh_start/core/presentation/widgets/general_button.dart';
import 'package:fresh_start/core/presentation/widgets/input_text.dart';
import 'package:fresh_start/styles.dart';
import 'package:local_auth/local_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

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
          builder: (BuildContext context) => const HomePage(),
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

    return Scaffold(
      body: SingleChildScrollView(
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
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Correo',
                          suffixIcon: Icon(Icons.email),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Contraseña',
                          suffixIcon: Icon(Icons.visibility_off),
                        ),
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
    );
  }
}
