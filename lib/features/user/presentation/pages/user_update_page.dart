import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/old%20widgets/app_bar.dart';
import 'package:fresh_start/core/presentation/widgets/custom_button.dart';
import 'package:fresh_start/core/presentation/widgets/custom_text_form_field.dart';
import 'package:fresh_start/core/utils/snackbar_utils.dart';
import 'package:fresh_start/core/utils/string_utils.dart';
import 'package:fresh_start/core/utils/validators.dart';
import 'package:fresh_start/features/user/data/models/user_model.dart';
import 'package:fresh_start/features/user/data/models/user_update_model.dart';
import 'package:fresh_start/features/user/data/repositories/user_repository_impl.dart';
import 'package:fresh_start/features/user/domain/usecases/user_update_usecase.dart';
import 'package:fresh_start/features/user/domain/usecases/user_usecase.dart';
import 'package:fresh_start/features/user/presentation/blocs/user_update_bloc.dart';
import 'package:fresh_start/shared/presentation/section/error_page.dart';
import 'package:fresh_start/shared/presentation/section/loading_page.dart';
import 'package:fresh_start/shared/presentation/theme/colors.dart';
import 'package:fresh_start/shared/presentation/theme/icons.dart';
import 'package:fresh_start/shared/presentation/theme/text_styles.dart';

class UserUpdatePage extends StatefulWidget {
  const UserUpdatePage({super.key});

  @override
  _UserUpdatePageState createState() => _UserUpdatePageState();
}

class _UserUpdatePageState extends State<UserUpdatePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController rfcController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController idBankController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final connectivity = Connectivity();

    final userRepository = UserRepositoryImpl(connectivity: connectivity);
    final userUseCase = UserUseCase(userRepository);
    final userUpdateUseCase = UserUpdateUseCase(userRepository);
    final userBloc = UserUpdateBloc(
        userUseCase: userUseCase, userUpdateUseCase: userUpdateUseCase)
      ..add(GetDataEvent());

    return BlocProvider(
      create: (context) => userBloc,
      child: BlocListener<UserUpdateBloc, UserUpdateState>(
        listener: (context, state) {
          if (state is UserUpdateErrorSubmited) {
            showCustomSnackBar(context, state.message, false);
            BlocProvider.of<UserUpdateBloc>(context).add(GetDataEvent());
          } else if (state is UserUpdateSuccess) {
            BlocProvider.of<UserUpdateBloc>(context).add(GetDataEvent());
            Future.delayed(const Duration(seconds: 1), () {
              showCustomSnackBar(context, 'Actualizado con éxito.', true);
            });
          }
        },
        child: BlocBuilder<UserUpdateBloc, UserUpdateState>(
          builder: (context, state) {
            if (state is UserUpdateLoading) {
              return const LoadingPage();
            } else if (state is UserUpdateErrorLoaded) {
              return ErrorPage<UserUpdateBloc, UserUpdateEvent>(
                  bloc: BlocProvider.of<UserUpdateBloc>(context),
                  event: GetDataEvent());
            } else if (state is UserUpdateLoaded) {
              return buildUserUpdatePage(context, state.user, state);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget buildUserUpdatePage(
      BuildContext context, UserModel userData, UserUpdateState state) {
    nameController.text = userData.name;
    lastnameController.text = userData.lastname;
    emailController.text = userData.email;
    phoneController.text = userData.phone;
    rfcController.text = userData.rfc;

    return Scaffold(
      appBar: AppBarWidget(
        titleAppBar: "Editar perfil",
        onBackButtonPressed: () {
          Navigator.pop(context, true);
        },
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 60.0,
                backgroundColor: AppColors.colorSecondaryComplementary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      getInitials(userData.name, userData.lastname),
                      style: AppTextStyles.display1
                          .copyWith(fontSize: 60, color: Colors.white),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Form(
                  key: _key,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: nameController,
                        label: 'Nombre(s)',
                        icon: AppIcons.person,
                        validator: Validators.validateName,
                      ),
                      const SizedBox(height: 14.0),
                      CustomTextFormField(
                        controller: lastnameController,
                        label: 'Apellidos',
                        icon: AppIcons.person,
                        validator: Validators.validateLastName,
                      ),
                      const SizedBox(height: 14.0),
                      CustomTextFormField(
                        controller: emailController,
                        label: 'Email',
                        icon: AppIcons.email,
                        validator: Validators.validateEmail,
                      ),
                      const SizedBox(height: 14.0),
                      CustomTextFormField(
                        controller: phoneController,
                        label: 'Teléfono',
                        icon: AppIcons.phone,
                        validator: Validators.phoneNumber,
                      ),
                      const SizedBox(height: 14.0),
                      CustomTextFormField(
                        controller: rfcController,
                        label: 'RFC',
                        icon: AppIcons.rfc,
                        validator: Validators.validateRFC,
                      ),
                    ],
                  )),
              Expanded(
                child: Container(),
              ),
              CustomButton(
                label: "Actualizar",
                isLoading: state is UserUpdateLoading,
                isEnabled: true,
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    final update = UserUpdateModel(
                        name: nameController.text,
                        lastname: lastnameController.text,
                        email: emailController.text,
                        rfc: rfcController.text,
                        phone: phoneController.text,
                        id_bank: 7);
                    BlocProvider.of<UserUpdateBloc>(context)
                        .add(SubmittedDataEvent(update: update));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
