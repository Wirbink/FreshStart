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
import 'package:fresh_start/domain/models/Auth/register_model.dart';
import 'package:fresh_start/domain/usecases/Login/register_data.dart';
import 'package:fresh_start/styles.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController rfcController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController idBankController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final userRepository = RegisterRepositoryImpl();
    final registerData = RegisterData(userRepository);

    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterBloc(registerData),
        child: SingleChildScrollView(
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
                          if (state is RegisterInitial) {
                            return buildForm(context);
                          } else if (state is RegisterLoading) {
                            return const CircularProgressIndicator();
                          } else if (state is RegisterSuccess) {
                            return const Text(
                                'Register data submitted successfully');
                          } else if (state is RegisterError) {
                            print("Hola entre al error");
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

  Widget buildForm(BuildContext context) {
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
                    .add(SubmitRegisterEvent(user));
              },
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        DividerWidget(),
        const SizedBox(height: 8.0),
        Center(
          child: GestureDetector(
            child: const GeneralButtonWidget(text: "Iniciar Sesión"),
          ),
        ),
      ],
    );
  }
}
