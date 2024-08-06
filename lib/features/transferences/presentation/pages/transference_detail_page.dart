import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fresh_start/core/presentation/old%20widgets/app_bar.dart';
import 'package:fresh_start/core/utils/string_utils.dart';
import 'package:fresh_start/features/transferences/data/model/transference_specific_model.dart';
import 'package:fresh_start/features/transferences/data/repositories/transferences_repository_impl.dart';
import 'package:fresh_start/features/transferences/domain/usecases/transferences_specific_usecase.dart';
import 'package:fresh_start/features/transferences/presentation/bloc/transferences_detail_bloc/transference_bloc.dart';
import 'package:fresh_start/shared/presentation/section/error_page.dart';
import 'package:fresh_start/shared/presentation/section/loading_page.dart';
import 'package:fresh_start/shared/presentation/theme/colors.dart';
import 'package:fresh_start/shared/presentation/theme/text_styles.dart';

class TransferenceDetailPage extends StatelessWidget {
  final int id;

  const TransferenceDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final connectivity = Connectivity();

    final transferenceRepository =
        TransferenceRepositoryImpl(connectivity: connectivity);
    final transferenceUseCase =
        TransferencesSpecificUseCase(transferenceRepository);
    final transferenceBloc =
        TransferenceBloc(transferenceUseCase: transferenceUseCase)
          ..add(GetDataEvent(id: id));

    return BlocProvider(
        create: (context) => transferenceBloc,
        child: BlocBuilder<TransferenceBloc, TransferenceState>(
          builder: (context, state) {
            if (state is TransferenceLoading) {
              return const LoadingPage();
            } else if (state is TransferenceSuccess) {
              return buildTransferenceDetailPage(state.transference);
            } else if (state is TransferenceError) {
              return ErrorPage<TransferenceBloc, GetDataEvent>(
                bloc: BlocProvider.of<TransferenceBloc>(context),
                event: GetDataEvent(id: id),
              );
            } else {
              return Container();
            }
          },
        ));
  }

  Widget buildTransferenceDetailPage(TransferenceSpecificModel transference) {
    return Scaffold(
        appBar: const AppBarWidget(titleAppBar: 'Cuenta'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Detalle de Pago',
                      style: AppTextStyles.heading1,
                    ),
                    Expanded(child: Container()),
                    SvgPicture.asset(
                      'assets/svg/Logotipo.svg',
                      width: 150,
                      height: 32,
                    )
                  ],
                ),
                SizedBox(height: 36.0),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "FreshBank",
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'MarkPro',
                          color: Color(0xFF060912),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const CircleAvatar(
                        backgroundColor: Color(0xFF20B087),
                        radius: 50,
                        child: Icon(
                          Icons.check,
                          size: 70,
                          color: Color(0XFFFAFAFA),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const Text('¡Pago exitoso!',
                          style: AppTextStyles.heading1),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text('\$ ${doubleToIntegerMoney(transference.amount)}',
                          style: AppTextStyles.heading3.copyWith(fontSize: 30)),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text('06 ENE, 2024 -- 18:15',
                          style: AppTextStyles.paragraph2
                              .copyWith(color: AppColors.colorBorder)),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Cuenta destino",
                              style: AppTextStyles.paragraph1),
                          Text(transference.receptor_account,
                              style: AppTextStyles.paragraph1
                                  .copyWith(color: AppColors.colorBorder)),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Factura",
                              style: AppTextStyles.paragraph1),
                          Text(transference.owner,
                              style: AppTextStyles.paragraph1
                                  .copyWith(color: AppColors.colorBorder)),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Concepto",
                              style: AppTextStyles.paragraph1),
                          Text(transference.concept,
                              style: AppTextStyles.paragraph1
                                  .copyWith(color: AppColors.colorBorder)),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Pagaste con",
                              style: AppTextStyles.paragraph1),
                          Text(transference.sender_account,
                              style: AppTextStyles.paragraph1
                                  .copyWith(color: AppColors.colorBorder)),
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
