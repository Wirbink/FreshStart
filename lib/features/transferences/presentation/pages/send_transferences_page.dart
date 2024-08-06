import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/StatementAccount/specific_transfer_detail_state.dart';
import 'package:fresh_start/core/presentation/old%20widgets/app_bar.dart';
import 'package:fresh_start/core/presentation/widgets/custom_button.dart';
import 'package:fresh_start/core/presentation/widgets/custom_text_form_field.dart';
import 'package:fresh_start/core/utils/snackbar_utils.dart';
import 'package:fresh_start/features/home/presentation/pages/home_page.dart';
import 'package:fresh_start/features/transferences/data/model/send_transferences_model.dart';
import 'package:fresh_start/features/transferences/data/repositories/transferences_repository_impl.dart';
import 'package:fresh_start/features/transferences/domain/usecases/send_transferences_usecase.dart';
import 'package:fresh_start/features/transferences/presentation/bloc/send_transferences_bloc/send_transferences_bloc.dart';
import 'package:fresh_start/shared/presentation/section/loading_page.dart';
import 'package:fresh_start/shared/presentation/utils/navigation.dart';

class SendTransferencesPage extends StatefulWidget {
  final String userAccount;

  const SendTransferencesPage({super.key, required this.userAccount});

  @override
  _SendTransferencesPageState createState() => _SendTransferencesPageState();
}

class _SendTransferencesPageState extends State<SendTransferencesPage> {
  final TextEditingController receptorAccountController =
      TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController conceptController = TextEditingController();
  final TextEditingController ownerController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final connectivity = Connectivity();
    final transferenceRepository =
        TransferenceRepositoryImpl(connectivity: connectivity);
    final sendTransference = SendTransferencesUseCase(transferenceRepository);
    final transferenceBloc =
        SendTransferencesBloc(sendTransferencesUseCase: sendTransference);

    return BlocProvider(
      create: (context) => transferenceBloc,
      child: BlocListener<SendTransferencesBloc, SendTransferencesState>(
        listener: (context, state) {
          if (state is SendTransferencesError) {
            showCustomSnackBar(context, state.message, false);
            BlocProvider.of<SendTransferencesBloc>(context).add(ReloadEvent());
          } else if (state is SendTransferencesSuccess) {
            showCustomSnackBar(context, 'Transferencia éxitosa', true);
            navigateToAndRemoveUntil(context, const HomePage());
          }
        },
        child: BlocBuilder<SendTransferencesBloc, SendTransferencesState>(
          builder: (context, state) {
            if (state is SendTransferencesLoading) {
              return const LoadingPage();
            } else if (state is SendTransferencesInitial) {
              return buildSendTransfer(context);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget buildSendTransfer(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(titleAppBar: 'Transacciones'),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  CustomTextFormField(
                    controller: receptorAccountController,
                    label: 'Tarjeta destino',
                    icon: Icons.credit_card,
                  ),
                  const SizedBox(height: 12.0),
                  CustomTextFormField(
                    controller: amountController,
                    label: 'Monto',
                    icon: Icons.attach_money,
                    inputType: TextInputType.number,
                  ),
                  const SizedBox(height: 12.0),
                  CustomTextFormField(
                    controller: ownerController,
                    label: 'Factura',
                    icon: Icons.receipt,
                  ),
                  const SizedBox(height: 12.0),
                  CustomTextFormField(
                    controller: conceptController,
                    label: 'Concepto',
                    icon: Icons.text_fields,
                  ),
                  const SizedBox(height: 200.0),
                  Center(
                    child: CustomButton(
                      isEnabled: true,
                      label: 'Confirmar',
                      onPressed: () {
                        final transference = SendTransferencesModel(
                            amount: double.parse(amountController.text),
                            user_account: widget.userAccount,
                            receptor_account: receptorAccountController.text,
                            concept: conceptController.text,
                            owner: ownerController.text);
                        BlocProvider.of<SendTransferencesBloc>(context).add(
                            SubmittedDataEvent(transference: transference));
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            )),
      ),
    );
  }
}
