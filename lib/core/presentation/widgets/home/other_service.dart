import 'package:flutter/material.dart';
import 'package:fresh_start/core/presentation/views/CoDi/codi_register_view.dart';
import 'package:fresh_start/core/presentation/views/Recharges/recharges_view.dart';
import 'package:fresh_start/core/presentation/views/Transfers/International%20Transfers/international_transfer.dart';
import 'package:fresh_start/core/presentation/widgets/home/service_icon_button.dart';
import 'package:fresh_start/main.dart';

class OtherServiceSection extends StatelessWidget {
  const OtherServiceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 25.0),
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
                    "Otros Servicios",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 25.0, bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ServiceIconButton(
                      title1: "Transferir",
                      title2: "Internacional",
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFFFAFAFA),
                      ),
                      bgColor: const Color(0xFF034F8D),
                      fgColor: const Color(0xFF060912),
                      onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const InternationalTrasnfersView()));
                                  },
                    ),
                    ServiceIconButton(
                      title1: "Recarga",
                      title2: "Celular",
                      icon: const Icon(
                        Icons.phone_android,
                        color: Color(0xFFFAFAFA),
                      ),
                      bgColor: const Color(0xFF034F8D),
                      fgColor: const Color(0xFF060912),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RechargesView()));
                      },
                    ),
                    ServiceIconButton(
                      title1: "Operaciones",
                      title2: "QR",
                      icon: const Icon(
                        Icons.qr_code_2,
                        color: Color(0xFFFAFAFA),
                      ),
                      bgColor: const Color(0xFF034F8D),
                      fgColor: const Color(0xFF060912),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CodiRegisterView()));
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
