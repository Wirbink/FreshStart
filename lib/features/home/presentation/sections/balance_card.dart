import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh_start/features/contacts/presentation/pages/contacts_page.dart';
import 'package:fresh_start/features/home/presentation/widgets/service_button.dart';
import 'package:fresh_start/features/statement_account/presentation/pages/statement_account_page.dart';
import 'package:fresh_start/features/transferences/presentation/pages/send_transferences_page.dart';
import 'package:fresh_start/shared/presentation/theme/colors.dart';
import 'package:fresh_start/shared/presentation/theme/icons.dart';
import 'package:fresh_start/shared/presentation/theme/spacing.dart';
import 'package:fresh_start/shared/presentation/theme/text_styles.dart';
import 'package:fresh_start/shared/presentation/utils/navigation.dart';

class BalanceCard extends StatefulWidget {
  final String integerPart;
  final String decimalPart;
  final String userAccount;

  const BalanceCard(
      {super.key,
      required this.integerPart,
      required this.decimalPart,
      required this.userAccount});

  @override
  _BalanceCardState createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  bool _obscureBalance = true;

  void _toggleBalanceVisibility() {
    setState(() {
      _obscureBalance = !_obscureBalance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: const EdgeInsets.only(top: AppSpacing.verticalPadding),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 210,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              alignment: AlignmentDirectional.centerStart,
              padding:
                  const EdgeInsets.only(left: 25.0, top: 10.0, right: 25.0),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tú Saldo Disponible',
                            style: AppTextStyles.heading2
                                .copyWith(color: Colors.white)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 100.0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _obscureBalance
                                        ? '••••'
                                        : widget.integerPart,
                                    style: AppTextStyles.display1.copyWith(
                                        color: Colors.white,
                                        fontFamily: 'Roboto'),
                                  ),
                                  Text(
                                    _obscureBalance ? '••' : widget.decimalPart,
                                    style: AppTextStyles.heading3.copyWith(
                                        color: Colors.white,
                                        fontFamily: 'Roboto'),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: _toggleBalanceVisibility,
                                icon: Icon(
                                  _obscureBalance
                                      ? AppIcons.visibilityOff
                                      : AppIcons.visibility,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/images/mc_symbol.svg',
                          height: 63,
                          width: 89,
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: AppSpacing.large),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ServiceButton(
                          label: 'Transferir',
                          icon: AppIcons.transfer,
                          bgColor: Colors.white,
                          iconColor: AppColors.colorPrimaryComplementary,
                          fgColor: Colors.white,
                          //TODO: Hacer vista de Transferencias
                          onPressed: () => navigateTo(
                              context,
                              ContactsPage(
                                userAccount: widget.userAccount,
                              ))),
                      ServiceButton(
                          label: 'Retiro sin Tarjeta',
                          icon: AppIcons.withdrawal,
                          bgColor: Colors.white,
                          iconColor: AppColors.colorPrimaryComplementary,
                          fgColor: Colors.white,
                          // TODO: Hacer vista de Retiro
                          onPressed: () => navigateTo(context, Container())),
                      ServiceButton(
                          label: 'Pago de Servicio',
                          icon: AppIcons.servicePayment,
                          bgColor: Colors.white,
                          iconColor: AppColors.colorPrimaryComplementary,
                          fgColor: Colors.white,
                          // TODO: Hacer vista de Pago de servicios
                          onPressed: () => navigateTo(context, Container())),
                      ServiceButton(
                          label: 'Estado de Cuenta',
                          icon: AppIcons.statementAccount,
                          bgColor: Colors.white,
                          iconColor: AppColors.colorPrimaryComplementary,
                          fgColor: Colors.white,
                          //TODO: Hacer vista de Estado de cuenta
                          onPressed: () =>
                              navigateTo(context, StatementAccountPage()))
                    ],
                  ),
                )
              ]),
            ),
          )),
    );
  }
}
