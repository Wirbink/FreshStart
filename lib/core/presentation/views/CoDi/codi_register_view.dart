import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh_start/core/presentation/bloc/CoDi/codi_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/CoDi/codi_event.dart';
import 'package:fresh_start/core/presentation/bloc/CoDi/codi_state.dart';
import 'package:fresh_start/core/presentation/widgets/app_bar.dart';
import 'package:fresh_start/core/presentation/widgets/general_button.dart';
import 'package:fresh_start/core/presentation/widgets/subtitle.dart';
import 'package:fresh_start/data/repositories/CoDi/codi_repository_impl.dart';
import 'package:fresh_start/domain/usecases/CoDi/codi_data.dart';
import 'package:fresh_start/styles.dart';

class CodiRegisterView extends StatelessWidget {
  const CodiRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            CodiBloc(CodiData(CodiRepositoryImpl()))..add(LoadCodiDataEvent()),
        child: Scaffold(
          appBar: const AppBarWidget(
            titleAppBar: 'CoDi',
          ),
          body: BlocBuilder<CodiBloc, CodiState>(
            builder: (context, state) {
              TextEditingController amountController = TextEditingController(text: state.amount.toString());
              TextEditingController conceptController = TextEditingController(text: state.concept);

              return SafeArea(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 261,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    state.cardNumber,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Roboto'),
                                  ),
                                  const SizedBox(
                                    width: 30.0,
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/mc_symbol.svg',
                                    height: 63,
                                    width: 89,
                                  )
                                ],
                              ),
                              const SizedBox(height: 12.0),
                              const Text(
                                'Tu saldo Disponible',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'MarkPro',
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 12.0),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextRobotoBold(
                                    text: '\$ ${state.amount.toInt()}',
                                    size: 30.0,
                                    color: Colors.white,
                                  ),
                                  const TextRobotoBold(
                                    text: '36',
                                    size: 15.0,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 12),
                                  const Icon(
                                    Icons.visibility_off,
                                    color: colorTertearyText,
                                    size: 26.0,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12.0),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Vencimiento',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'CVV',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.vencimiento,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    state.cvv,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const SubtitleWidget(subtitleText: 'Importe'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '\$',
                            style: TextStyle(
                                color: Color(0xFF060912),
                                fontSize: 40,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(width: 4),
                          SizedBox(
                            width: 125,
                            child: TextFormField(
                              controller: amountController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              style: const TextStyle(fontSize: 40),
                            ),
                          ),
                        ],
                      ),
                      const SubtitleWidget(subtitleText: 'Concepto'),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: TextField(
                                controller: conceptController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Escribe el concepto (opcional)',
                                ),
                                keyboardType: TextInputType.text,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 100.0),
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 25.0),
                          child: GeneralButtonWidget(text: 'Generar QR'),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
