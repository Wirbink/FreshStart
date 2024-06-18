import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/Home/home_bloc.dart';
import 'package:fresh_start/core/presentation/bloc/Home/home_event.dart';
import 'package:fresh_start/core/presentation/bloc/Home/home_state.dart';
import 'package:fresh_start/core/presentation/views/estado_cuenta_view.dart';
import 'package:fresh_start/core/presentation/widgets/home/app_bar_home.dart';
import 'package:fresh_start/core/presentation/widgets/home/card_section.dart';
import 'package:fresh_start/core/presentation/widgets/home/home_card.dart';
import 'package:fresh_start/core/presentation/widgets/home/other_service.dart';
import 'package:fresh_start/data/repositories/CashExpress/cash_express_repository_impl.dart';
import 'package:fresh_start/data/repositories/Transfers/contacts_repository_impl.dart';
import 'package:fresh_start/domain/usecases/CashExpress/cash_express_data.dart';
import 'package:fresh_start/domain/usecases/Transfers/contact_data.dart';
import 'package:fresh_start/styles.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBLoc(
        CashExpressData(CashExpressRepositoryImpl()),
        ContactData(ContactsRepositoryImpl()),
      )..add(LoadHomeDataEvent()),
      child: BlocBuilder<HomeBLoc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBarHome(
              username: state.sender,
            ),
            body: ListView(
              // Ensure closing parenthesis here
              children: [
                CardSection(
                  balance: state.balance,
                ),
                const OtherServiceSection(),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      top: 12.0,
                      right: 20.0,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const TextMarkProBold(
                              text: 'Actividad Reciente',
                              size: 20.0,
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const EstadoDeCuentaWidget1(),
                                  ),
                                );
                              },
                              child: const TextMarkProMedium(
                                text: 'Ver todos',
                                size: 15.0,
                                color: colorPrimaryComplementary,
                              ),
                            ),
                          ],
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.contacts.length,
                            itemBuilder: (context, index) {
                              return HomeCard(
                                name: state.contacts[index].name,
                                bill: state.contacts[index].bill,
                                spent: state.contacts[index].spent,
                                date: state.contacts[index].date,
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
