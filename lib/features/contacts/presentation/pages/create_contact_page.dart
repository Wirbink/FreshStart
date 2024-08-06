import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/old%20widgets/app_bar.dart';
import 'package:fresh_start/core/presentation/widgets/custom_button.dart';
import 'package:fresh_start/core/presentation/widgets/custom_text_form_field.dart';
import 'package:fresh_start/core/utils/snackbar_utils.dart';
import 'package:fresh_start/core/utils/validators.dart';
import 'package:fresh_start/features/contacts/data/model/create_contact_model.dart';
import 'package:fresh_start/features/contacts/data/repositories/contact_repository_impl.dart';
import 'package:fresh_start/features/contacts/domain/usecase/create_contact_usecase.dart';
import 'package:fresh_start/features/contacts/presentation/bloc/create_contact/contact_bloc.dart';
import 'package:fresh_start/features/home/presentation/pages/home_page.dart';
import 'package:fresh_start/shared/presentation/section/loading_page.dart';
import 'package:fresh_start/shared/presentation/utils/navigation.dart';

class CreateContactPage extends StatelessWidget {
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController banknameController = TextEditingController();
  final TextEditingController accountController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final connectivity = Connectivity();

    final contactRepository = ContactRepositoryImpl(connectivity: connectivity);
    final contactUseCase = CreateContactUseCase(contactRepository);
    final contactBloc = ContactBloc(createContactUseCase: contactUseCase);

    return BlocProvider(
      create: (context) => contactBloc,
      child: BlocListener<ContactBloc, ContactState>(
        listener: (context, state) {
          if (state is ContactSuccess) {
            showCustomSnackBar(context, 'Contacto creado con éxito.', true);
            Navigator.pop(context, true);
          } else if (state is ContactError) {
            showCustomSnackBar(context, state.message, false);
            BlocProvider.of<ContactBloc>(context).add(ReloadEvent());
          }
        },
        child: BlocBuilder<ContactBloc, ContactState>(
          builder: (context, state) {
            if (state is ContactLoading) {
              return const LoadingPage();
            } else if (state is ContactInitial) {
              return buildCreateContactPage(context);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget buildCreateContactPage(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        titleAppBar: "Crear Contacto",
        onBackButtonPressed: () {
          Navigator.pop(context, true);
        },
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Form(
                key: _key,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: nicknameController,
                      label: 'Apodo',
                      icon: Icons.person,
                      validator: Validators.validateName,
                    ),
                    const SizedBox(height: 14.0),
                    CustomTextFormField(
                      controller: emailController,
                      label: 'Email',
                      icon: Icons.email,
                      validator: Validators.validateEmail,
                    ),
                    const SizedBox(height: 14.0),
                    CustomTextFormField(
                      controller: phoneController,
                      label: 'Teléfono',
                      icon: Icons.phone,
                      validator: Validators.phoneNumber,
                    ),
                    const SizedBox(height: 14.0),
                    CustomTextFormField(
                      controller: banknameController,
                      label: 'Banco',
                      icon: Icons.account_balance,
                      // validator: Validators.validateBankName,
                    ),
                    const SizedBox(height: 14.0),
                    CustomTextFormField(
                      controller: accountController,
                      label: 'Numero de Tarjeta',
                      icon: Icons.credit_card,
                      // validator: Validators.validateCardNumber,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(),
              ),
              CustomButton(
                label: "Crear Contacto",
                isLoading: false,
                isEnabled: true,
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    // Aquí puedes agregar la lógica para crear el contacto.
                    final contact = CreateContactModel(
                        nickname: nicknameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        bankname: banknameController.text,
                        account: accountController.text);
                    BlocProvider.of<ContactBloc>(context)
                        .add(SubmittedDataEvent(contact: contact));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
