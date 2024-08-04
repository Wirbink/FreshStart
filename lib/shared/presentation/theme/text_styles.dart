import 'package:flutter/material.dart';
import 'package:fresh_start/shared/presentation/theme/colors.dart';

class AppTextStyles {
  static const TextStyle display1 = TextStyle(
    fontFamily: 'MarkPro',
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
    color: AppColors.colorMainText,
  );

  static const TextStyle heading1 = TextStyle(
      fontFamily: 'MarkPro',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.colorMainText);

  static const TextStyle heading2 = TextStyle(
      fontFamily: 'MarkPro',
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
      color: AppColors.colorMainText);

  static const TextStyle heading3 = TextStyle(
      fontFamily: 'MarkPro',
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
      color: AppColors.colorMainText);

  static const TextStyle paragraph1 = TextStyle(
      fontFamily: 'MarkPro',
      fontSize: 15.0,
      fontWeight: FontWeight.normal,
      color: AppColors.colorMainText);

  static const TextStyle paragraph2 = TextStyle(
      fontFamily: 'MarkPro',
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: AppColors.colorMainText);

  static const TextStyle buttonText = TextStyle(
      fontFamily: 'MarkPro',
      fontSize: 18.0,
      fontWeight: FontWeight.w800,
      color: AppColors.colorMainText);

  static const TextStyle hyperlink = TextStyle(
      fontFamily: 'MarkPro',
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
      color: AppColors.colorPrimary);
}
