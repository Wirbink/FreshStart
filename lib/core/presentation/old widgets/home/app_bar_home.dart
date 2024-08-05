import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/features/home/presentation/blocs/home_bloc.dart';
import 'package:fresh_start/features/user/presentation/pages/user_update_page.dart';
import 'package:fresh_start/shared/presentation/utils/navigation.dart';
import 'package:fresh_start/styles.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  final String username;

  const AppBarHome({super.key, required this.username});

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    String initials = getInitials(username);

    return AppBar(
      backgroundColor: colorBackground,
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserUpdatePage()),
              ).then((result) {
                if (result == true) {
                  // Volver a disparar el evento para recargar los datos
                  BlocProvider.of<HomeBloc>(context).add(GetDataEvent());
                }
              });
            },
            child: Container(
              padding: const EdgeInsets.only(left: 20.0),
              child: CircleAvatar(
                radius: 35.0,
                backgroundColor: colorSecondaryComplementary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextRobotoBold(
                      text: initials,
                      color: Colors.white,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextMarkProRegular(
                  text: 'Hola',
                  size: 20.0,
                ),
                TextMarkProBold(
                  text: username,
                  size: 20,
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.refresh,
                  color: colorPrimaryComplementary,
                  size: 25.0,
                )),
          )
        ],
      ),
      toolbarHeight: 80.0,
      titleSpacing: 0.0,
    );
  }

  //Funciones de apoyo
  String getInitials(String name) {
    List<String> names = name.split(' ');
    String initials = '';
    for (var part in names) {
      if (part.isNotEmpty) {
        initials += part[0];
      }
    }
    return initials.toUpperCase();
  }
}
