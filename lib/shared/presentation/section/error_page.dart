import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fresh_start/core/presentation/widgets/custom_button.dart';
import 'package:fresh_start/shared/presentation/theme/colors.dart';
import 'package:fresh_start/shared/presentation/theme/spacing.dart';
import 'package:fresh_start/shared/presentation/theme/text_styles.dart';

class ErrorPage<B extends Bloc<dynamic, dynamic>, E> extends StatelessWidget {
  final B bloc;
  final E event;

  const ErrorPage({
    Key? key,
    required this.bloc,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/NoData.svg',
            width: 300,
            height: 300,
          ),
          const SizedBox(
            height: AppSpacing.small,
          ),
          Text(
            '¡Ha ocurrido un error!',
            style: AppTextStyles.heading1
                .copyWith(color: AppColors.colorSecondaryText),
          ),
          const SizedBox(
            height: AppSpacing.extraLarge,
          ),
          Center(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: CustomButton(
                label: 'Reintentar',
                onPressed: () {
                  bloc.add(event);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
