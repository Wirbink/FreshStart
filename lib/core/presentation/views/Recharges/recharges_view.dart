import 'package:flutter/material.dart';
import 'package:fresh_start/core/presentation/views/Recharges/service__number.dart';
import 'package:fresh_start/core/presentation/old%20widgets/app_bar.dart';
import 'package:fresh_start/core/presentation/old%20widgets/recharges/buildResponsiveButtonRow.dart';
import 'package:fresh_start/core/presentation/old%20widgets/recharges/buildRoundedButton.dart';
import 'package:fresh_start/core/presentation/old%20widgets/subtitle.dart';

class RechargesView extends StatelessWidget {
  const RechargesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(titleAppBar: 'Recargas'),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            const SubtitleWidget(subtitleText: 'Selecciona la compañia'),
            const SizedBox(
              height: 20.0,
            ),
            BuildResponsiveButtonRowWidget(
              buttons: [
                BuildRoundedButtonWidget(
                  imagePath: 'assets/images/Telcel_logo.svg.png',
                  color: const Color(0xFFFAFAFA),
                  onPressed: () {
                    navigateToServiceNumber(context);
                  },
                ),
                BuildRoundedButtonWidget(
                  imagePath: 'assets/images/Movistar.png',
                  color: const Color(0xFFFAFAFA),
                  onPressed: () {
                    navigateToServiceNumber(context);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            BuildResponsiveButtonRowWidget(
              buttons: [
                BuildRoundedButtonWidget(
                  imagePath: 'assets/images/Unefon.png',
                  color: const Color(0xFFFAFAFA),
                  onPressed: () {
                    navigateToServiceNumber(context);
                  },
                ),
                BuildRoundedButtonWidget(
                  imagePath: 'assets/images/AT&T.png',
                  color: const Color(0xFFFAFAFA),
                  onPressed: () {
                    navigateToServiceNumber(context);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            BuildResponsiveButtonRowWidget(
              buttons: [
                BuildRoundedButtonWidget(
                  imagePath: 'assets/images/Virgin.png',
                  color: const Color(0xFFFAFAFA),
                  onPressed: () {
                    navigateToServiceNumber(context);
                  },
                ),
                BuildRoundedButtonWidget(
                  imagePath: 'assets/images/Vodafone.png',
                  color: const Color(0xFFFAFAFA),
                  onPressed: () {
                    navigateToServiceNumber(context);
                  },
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}

void navigateToServiceNumber(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ServiceNumber()),
  );
}
