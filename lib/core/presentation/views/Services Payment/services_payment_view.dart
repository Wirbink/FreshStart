import 'package:flutter/material.dart';
import 'package:fresh_start/core/presentation/old%20widgets/app_bar.dart';
import 'package:fresh_start/core/presentation/old%20widgets/general_button.dart';

class ServicePaymentView extends StatelessWidget {
  const ServicePaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(titleAppBar: 'Pago de Servicios'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              buildServiceCategory('Luz'),
              const SizedBox(height: 10),
              buildServiceItem('assets/images/CFE.png', 'CFE'),
              const SizedBox(height: 20),
              buildServiceCategory('Telefonía, Internet y TV'),
              const SizedBox(height: 10),
              buildServiceItem('assets/images/TELCEL.png', 'Telcel Postpago'),
              const SizedBox(height: 10),
              buildServiceItem('assets/images/TELMEX.png', 'Telmex'),
              const SizedBox(height: 10),
              buildServiceItem('assets/images/totalplay.png', 'TotalPlay'),
              const SizedBox(height: 20),
              buildServiceCategory('Agua'),
              const SizedBox(height: 10),
              buildServiceItem('assets/images/AGUAKAN.png', 'AGUAKAN (Cancún)'),
              const SizedBox(height: 100.0),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: GeneralButtonWidget(text: 'Continuar'),
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildServiceCategory(String categoryName) {
    return Row(
      children: [
        Text(
          categoryName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff060912),
          ),
        ),
      ],
    );
  }

  Widget buildServiceItem(String imagePath, String serviceName) {
    return Container(
      width: 365,
      height: 70,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            offset: Offset(0, 8),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset(
              imagePath,
              width: 50,
              height: 50,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              serviceName,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.normal,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
