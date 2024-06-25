import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh_start/core/presentation/bloc/add_new_contact_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/add_new_contact_state.dart';
import 'package:fresh_start/core/presentation/views/Transfers/add_new_contact.dart';
import 'package:fresh_start/core/presentation/widgets/app_bar.dart';
import 'package:fresh_start/core/presentation/widgets/general_button.dart';
import 'package:fresh_start/core/presentation/widgets/subtitle.dart';
import 'package:fresh_start/data/repositories/Transfers/trasnfers_repository_impl.dart';
import 'package:fresh_start/domain/usecases/Transfers/transfers_data.dart';

class NewContactView extends StatelessWidget {
  const NewContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            AddNewContactBloc(TransfersData(TrasnfersRepositoryImpl())),
        child: BlocBuilder<AddNewContactBloc, AddNewContactState>(
          builder: (context, state) {
            TextEditingController cardNumberController =
                TextEditingController(text: state.cardNumber);

            return Scaffold(
                appBar: const AppBarWidget(titleAppBar: 'Nuevo Contacto'),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SubtitleWidget(subtitleText: 'Nuevo Destinatario'),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: Container(
                          padding: const EdgeInsets.all(25.0),
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: const Color(0XFFFAFAFA),
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
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0),
                                child: SvgPicture.asset(
                                  'assets/images/dataLoss.svg',
                                  height: 60.0,
                                  width: 60.0,
                                ),
                              ),
                              const Text(
                                'Introduce una cuenta, CLABE, tarjeta o celular para que te ayudemos con los datos del destinatario de cualquier banco:',
                                style: TextStyle(
                                    fontFamily: 'MarkPro',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 30.0, bottom: 15.0),
                                child: TextField(
                                  controller: cardNumberController,
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText:
                                          ('Cuenta, CLABE, Tarjeta de crédito.'),
                                      suffix: Icon(Icons.search)),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddNewContactView()));
                        },
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 25.0),
                          child: const GeneralButtonWidget(text: 'Buscar'),
                        ),
                      ),
                    ),
                  ],
                ));
          },
        ));
  }
}
