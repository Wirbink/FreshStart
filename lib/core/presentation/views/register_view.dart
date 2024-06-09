import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fresh_start/core/presentation/widgets/divider_widget.dart';
import 'package:fresh_start/core/presentation/widgets/general_button.dart';
import 'package:fresh_start/core/presentation/widgets/input_text.dart';
import 'package:fresh_start/styles.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _acceptedTerms = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/LoginFreshBank.png'),
                fit: BoxFit.cover),
          ),
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
                    const Text(
                      "Registro",
                      style: TextStyle(
                          fontFamily: 'MarkPro',
                          fontWeight: FontWeight.w900,
                          fontSize: 30.0),
                    ),
                    const SizedBox(height: 24.0),
                    const InputText(
                        placeholder: "Nombre",
                        iconPlaceholder: Icon(
                          Icons.person,
                          color: colorBorder,
                        )),
                    const SizedBox(height: 14.0),
                    const InputText(
                        placeholder: "Apellido",
                        iconPlaceholder: Icon(
                          Icons.person,
                          color: colorBorder,
                        )),
                    const SizedBox(height: 14.0),
                    const InputText(
                        placeholder: "Email",
                        iconPlaceholder: Icon(
                          Icons.email_outlined,
                          color: colorBorder,
                        )),
                    const SizedBox(height: 14.0),
                    const InputText(
                        placeholder: "Teléfono",
                        iconPlaceholder: Icon(
                          Icons.phone,
                          color: colorBorder,
                        )),
                    const SizedBox(height: 14.0),
                    const InputText(
                        placeholder: "Nacimiento",
                        iconPlaceholder: Icon(
                          Icons.cake,
                          color: colorBorder,
                        )),
                    const SizedBox(height: 14.0),
                    const InputText(
                        placeholder: "País",
                        iconPlaceholder: Icon(
                          Icons.apartment,
                          color: colorBorder,
                        )),
                    const SizedBox(height: 14.0),
                    const InputText(
                        placeholder: "RFC",
                        iconPlaceholder: Icon(
                          Icons.pin,
                          color: colorBorder,
                        )),
                    const SizedBox(height: 24.0),
                    const Text(
                      "TÉRMINOS Y CONDICIONES",
                      style: TextStyle(
                          fontFamily: 'MarkPro',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: _acceptedTerms,
                          onChanged: (bool? value) {
                            setState(() {
                              _acceptedTerms = value ?? false;
                            });
                          },
                        ),
                        const Text(
                          "Acepto los términos y condiciones",
                          style: TextStyle(
                              fontFamily: 'MarkPro',
                              fontWeight: FontWeight.w600, 
                              fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    Center(
                      child: GestureDetector(
                        child: const GeneralButtonWidget(text: "Registrarse"),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    DividerWidget(),
                    const SizedBox(height: 8.0),
                    Center(
                      child: GestureDetector(
                        child:
                            const GeneralButtonWidget(text: "Iniciar Sesión"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
