import 'package:flutter/material.dart';
import 'package:fresh_start/core/presentation/widgets/app_bar.dart';
import 'package:fresh_start/core/presentation/widgets/general_button.dart';
import 'package:fresh_start/styles.dart';

class UpdateUserPage extends StatefulWidget {
  //final String username;

  const UpdateUserPage({
    super.key,
    /* required this.username */
  });

  @override
  _UpdateUserPageState createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  @override
  Widget build(BuildContext context) {
    //String initials = getInitials(username);
    return Scaffold(
      appBar: const AppBarWidget(titleAppBar: "Editar perfil"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 60.0,
                backgroundColor: colorSecondaryComplementary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /* TextRobotoBold(
                    text: initials,
                    color: Colors.white,
                    size: 40,
                  ), */
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Brayn',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Sahagun',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'braynsahagun@gmail.com',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '9983983716',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'AYBQ161028018',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              const SizedBox(height: 24.0),
              Center(
                child: GestureDetector(
                  child: GeneralButtonWidget(
                    text: "Actualizar",
                    onPressed: () {
                      /* final user = RegisterModel(
                                    name: nameController.text,
                                    lastname: lastnameController.text,
                                    email: emailController.text,
                                    rfc: rfcController.text,
                                    phone: phoneController.text,
                                    password: passwordController.text,
                                    id_bank: 6,
                                  );
                                  BlocProvider.of<RegisterBloc>(context)
                                      .add(SubmitRegisterEvent(register: user)); */
                    },
                    /* isLoading: state is RegisterLoading, */
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getInitials(String name) {
    List<String> names = name.split(' ');
    String initials = '';
    for (var part in names) {
      if (part.isNotEmpty) {
        initials += part[0];
      }
    }
    return initials.toUpperCase();
  }
}
