import 'package:flutter/material.dart';
import 'package:fresh_start/core/utils/string_utils.dart';
import 'package:fresh_start/features/transferences/data/model/transference_model.dart';
import 'package:fresh_start/features/transferences/presentation/pages/transference_detail_page.dart';
import 'package:fresh_start/shared/presentation/theme/colors.dart';
import 'package:fresh_start/shared/presentation/theme/spacing.dart';
import 'package:fresh_start/shared/presentation/theme/text_styles.dart';
import 'package:fresh_start/shared/presentation/utils/navigation.dart';

class TransactionCard extends StatelessWidget {
  final TransferenceModel transference;

  const TransactionCard({super.key, required this.transference});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateTo(context, TransferenceDetailPage(id: transference.id)),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: AppSpacing.small),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.medium),
            color: AppColors.colorPanel,
            boxShadow: [
              BoxShadow(
                color: AppColors.colorMainText.withOpacity(0.1),
                blurRadius: 4.0,
                spreadRadius: 0.0,
                offset: const Offset(0.0, 6.0),
              ),
            ]),
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.extraSmall),
        child: Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(AppSpacing.small),
                  child: CircleAvatar(
                    backgroundColor: AppColors.colorSecondaryComplementary,
                    radius: AppSpacing.large,
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(AppSpacing.small),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text('Transferencia', style: AppTextStyles.paragraph1),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("\$ ${doubleToIntegerMoney(transference.amount)}",
                      style: AppTextStyles.heading2),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('20-01-2024',
                              style: AppTextStyles.paragraph2.copyWith(
                                  fontSize: 8,
                                  color: AppColors.colorTertearyText))
                        ],
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Column(
                        children: [
                          Text('10:00 PM',
                              style: AppTextStyles.paragraph2.copyWith(
                                  fontSize: 8,
                                  color: AppColors.colorTertearyText))
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
