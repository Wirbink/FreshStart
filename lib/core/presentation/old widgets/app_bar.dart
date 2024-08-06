import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String titleAppBar;
  final VoidCallback? onBackButtonPressed; // Callback opcional

  const AppBarWidget({
    super.key,
    required this.titleAppBar,
    this.onBackButtonPressed, // Inicializa el callback opcional
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        titleAppBar,
        style: const TextStyle(
            fontFamily: 'MarkPro',
            fontSize: 25.0,
            fontWeight: FontWeight.w700,
            color: Color(0xFF060912)),
      ),
      backgroundColor: const Color(0xFFF0F2F5),
      leading: GestureDetector(
        onTap: () {
          if (onBackButtonPressed != null) {
            onBackButtonPressed!();
          } else {
            Navigator.pop(context);
          }
        },
        child: const Icon(
          Icons.arrow_back_ios,
          size: 34.0,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
