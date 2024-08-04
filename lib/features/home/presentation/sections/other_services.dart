import 'package:flutter/material.dart';
import 'package:fresh_start/features/home/presentation/widgets/service_button.dart';
import 'package:fresh_start/shared/presentation/theme/colors.dart';
import 'package:fresh_start/shared/presentation/theme/icons.dart';
import 'package:fresh_start/shared/presentation/theme/spacing.dart';
import 'package:fresh_start/shared/presentation/theme/text_styles.dart';
import 'package:fresh_start/shared/presentation/utils/navigation.dart';

class OtherServices extends StatelessWidget {
  const OtherServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: AppSpacing.large),
        child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: const Color(0xFFFAFAFA)),
            padding: const EdgeInsets.only(left: 25.0, top: 10.0, right: 25.0),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      'Otros Servicios',
                      style: AppTextStyles.heading1,
                    )
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: AppSpacing.large),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ServiceButton(
                          label: 'Transferir Internacional',
                          icon: AppIcons.transfer,
                          bgColor: AppColors.colorPrimaryComplementary,
                          iconColor: Colors.white,
                          fgColor: AppColors.colorMainText,
                          //TODO: Hacer vista de Transferencia Internacional
                          onPressed: () => navigateTo(context, Container())),
                      ServiceButton(
                          label: 'Recarga Celualr',
                          icon: AppIcons.recharges,
                          bgColor: AppColors.colorPrimaryComplementary,
                          iconColor: Colors.white,
                          fgColor: AppColors.colorMainText,
                          // TODO: Hacer vista de Recarga Celular
                          onPressed: () => navigateTo(context, Container())),
                      ServiceButton(
                          label: 'Operaciones QR',
                          icon: AppIcons.qr,
                          bgColor: AppColors.colorPrimaryComplementary,
                          iconColor: Colors.white,
                          fgColor: AppColors.colorMainText,
                          //TODO: Hacer vista de Operaciones QR
                          onPressed: () => navigateTo(context, Container()))
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
