import 'package:flutter/material.dart';
import 'package:fresh_start/core/presentation/widgets/hyperlink.dart';
import 'package:fresh_start/features/statement_account/presentation/pages/statement_account_page.dart';
import 'package:fresh_start/features/transferences/data/model/transference_model.dart';
import 'package:fresh_start/shared/presentation/section/empty_data.dart';
import 'package:fresh_start/shared/presentation/theme/spacing.dart';
import 'package:fresh_start/shared/presentation/theme/text_styles.dart';
import 'package:fresh_start/shared/presentation/utils/navigation.dart';
import 'package:fresh_start/shared/presentation/widgets/transaction_card.dart';

class RecentActivity extends StatelessWidget {
  final List<TransferenceModel> activities;

  const RecentActivity({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(
          left: AppSpacing.large - 4,
          top: AppSpacing.medium - 4,
          right: AppSpacing.medium - 4,
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Actividad Reciente',
                  style: AppTextStyles.heading1,
                ),
                const Spacer(),
                activities.isNotEmpty ? Hyperlink(
                    isEnabled: activities.isNotEmpty,
                    onPressed: () =>
                        navigateTo(context, StatementAccountPage()),
                    label: 'Ver todos') : Container()
              ],
            ),
            activities.isEmpty
                ? const EmptyData(
                    message: 'No hay Actividad Reciente',
                    tip: '¡Realiza tu primer operación!')
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: activities.length > 5 ? 5 : activities.length,
                    itemBuilder: (context, index) {
                      return TransactionCard(transference: activities[index]);
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
