import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/Register/register_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/Register/register_event.dart';
import 'package:fresh_start/core/presentation/bloc/Register/register_state.dart';
import 'package:fresh_start/core/presentation/widgets/divider_widget.dart';
import 'package:fresh_start/core/presentation/widgets/general_button.dart';
import 'package:fresh_start/core/presentation/widgets/input_text.dart';
import 'package:fresh_start/data/repositories/Auth/register_repository_impl.dart';
import 'package:fresh_start/domain/usecases/Login/register_data.dart';
import 'package:fresh_start/styles.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
        create: (context) => RegisterBloc(
              RegisterData(RegisterRepositoryImpl()),
            )..add(LoadRegisterDataEvent()),
        child: Scaffold(
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
                        BlocBuilder<RegisterBloc, RegisterState>(
                          builder: (context, state) {
                            TextEditingController nameController =
                                TextEditingController(text: state.name);
                            TextEditingController lastnameController =
                                TextEditingController(text: state.lastname);
                            TextEditingController emailController =
                                TextEditingController(text: state.email);
                            TextEditingController rfcController =
                                TextEditingController(text: state.rfc);
                            TextEditingController phoneController =
                                TextEditingController(text: state.phone);
                            TextEditingController passwordController =
                                TextEditingController(text: state.password);
                            TextEditingController countryController =
                                TextEditingController(text: state.country);

                            return Column(
                              children: [
                                const Text(
                                  "Registro",
                                  style: TextStyle(
                                      fontFamily: 'MarkPro',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30.0),
                                ),
                                const SizedBox(height: 24.0),
                                InputText(
                                  placeholder: "Nombre",
                                  iconPlaceholder: const Icon(
                                    Icons.person,
                                    color: colorBorder,
                                  ),
                                  controller: nameController,
                                ),
                                const SizedBox(height: 14.0),
                                InputText(
                                  placeholder: "Apellido",
                                  iconPlaceholder: const Icon(
                                    Icons.person,
                                    color: colorBorder,
                                  ),
                                  controller: lastnameController,
                                ),
                                const SizedBox(height: 14.0),
                                InputText(
                                  placeholder: "Email",
                                  iconPlaceholder: const Icon(
                                    Icons.email_outlined,
                                    color: colorBorder,
                                  ),
                                  controller: emailController,
                                ),
                                const SizedBox(height: 14.0),
                                InputText(
                                  placeholder: "Contraseña",
                                  iconPlaceholder: const Icon(
                                    Icons.visibility_off,
                                    color: colorBorder,
                                  ),
                                  controller: passwordController,
                                ),
                                const SizedBox(height: 14.0),
                                InputText(
                                  placeholder: "Teléfono",
                                  iconPlaceholder: const Icon(
                                    Icons.phone,
                                    color: colorBorder,
                                  ),
                                  controller: phoneController,
                                ),
                                const SizedBox(height: 14.0),
                                InputText(
                                  placeholder: "País",
                                  iconPlaceholder: const Icon(
                                    Icons.apartment,
                                    color: colorBorder,
                                  ),
                                  controller: countryController,
                                ),
                                const SizedBox(height: 14.0),
                                InputText(
                                  placeholder: "RFC",
                                  iconPlaceholder: const Icon(
                                    Icons.pin,
                                    color: colorBorder,
                                  ),
                                  controller: rfcController,
                                ),
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
                                      value: state.acceptedTerms,
                                      onChanged: (bool? value) {
                                        context.read<RegisterBloc>().add(AcceptedTermsChanged(value ?? false));
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
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 24.0),
                        Center(
                          child: GestureDetector(
                            child:
                                const GeneralButtonWidget(text: "Registrarse"),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        DividerWidget(),
                        const SizedBox(height: 8.0),
                        Center(
                          child: GestureDetector(
                            child: const GeneralButtonWidget(
                                text: "Iniciar Sesión"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
