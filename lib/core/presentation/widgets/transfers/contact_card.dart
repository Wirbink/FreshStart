import 'package:flutter/material.dart';
import 'package:fresh_start/core/presentation/views/Transfers/National%20Transfers/second_national_transfers.dart';
import 'package:fresh_start/styles.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final String clabe;

  const ContactCard({
    super.key,
    required this.name,
    required this.clabe,
  });

  @override
  Widget build(BuildContext context) {
    String initials = getInitials(name);
    String nickname = getNickname(name);

    return GestureDetector(
      child: Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 7.5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: colorPanel,
              boxShadow: [
                BoxShadow(
                    color: colorMainText.withOpacity(0.1),
                    blurRadius: 4.0,
                    spreadRadius: 0.0,
                    offset: const Offset(0.0, 6.0))
              ]),
          padding: const EdgeInsets.only(
            top: 5.0,
            bottom: 5.0,
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundColor: colorSecondaryComplementary,
                      radius: 25.0,
                      child: Text(
                        initials,
                        style: const TextStyle(
                            fontFamily: 'MarkPro',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nickname,
                    style: const TextStyle(
                        fontFamily: 'MarkPro',
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        color: colorMainText),
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                        fontFamily: 'MarkPro',
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: colorMainText),
                  ),
                  const Text(
                    'FreshBank',
                    style: TextStyle(
                        fontFamily: 'MarkPro',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: colorBorder),
                  ),
                  Text(
                    clabe,
                    style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        color: colorNumberText),
                  )
                ],
              ),
            ],
          )),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const SecondNationalView()));
      },
    );
  }


  //Funciona de ayuda
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


  String getNickname(String name) {
    List<String> names = name.split(' ');
    if (names.length < 2) return name; // Si solo hay un nombre, devuelve el nombre original

    String firstName = names[0];
    String lastName = names[1];

    String nickname = '';
    if (firstName.length >= 3) {
      nickname += firstName.substring(0, 3);
    } else {
      nickname += firstName;
    }

    if (lastName.length >= 3) {
      nickname += lastName.substring(0, 3);
    } else {
      nickname += lastName;
    }

    return nickname;
  }
}
