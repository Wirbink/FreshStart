import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fresh_start/core/presentation/old%20widgets/app_bar.dart';
import 'package:fresh_start/core/presentation/old%20widgets/general_button.dart';
import 'package:fresh_start/core/presentation/old%20widgets/subtitle.dart';

class AddNewContactView extends StatelessWidget {
  const AddNewContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: const AppBarWidget(titleAppBar: 'Transacciones'),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16.0),
                      const SubtitleWidget(subtitleText: 'Nuevo Destinatario'),
                      const SizedBox(height: 16.0),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: const Color(0XFFFAFAFA),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'CLABE',
                                style: TextStyle(
                                  fontFamily: 'MarkPro',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: '12345678',
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.phone,
                                maxLength: 18,
                              ),
                              const Text(
                                'Entidad Bancaria',
                                style: TextStyle(
                                  fontFamily: 'MarkPro',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'MazeBank',
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter
                                      .singleLineFormatter
                                ],
                                keyboardType: TextInputType.text,
                                maxLength: 50,
                              ),
                              const Text(
                                'Nombre',
                                style: TextStyle(
                                  fontFamily: 'MarkPro',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Nombre del Destinatario',
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter
                                      .singleLineFormatter
                                ],
                                keyboardType: TextInputType.text,
                                maxLength: 50,
                              ),
                              const Text(
                                'Apodo',
                                style: TextStyle(
                                  fontFamily: 'MarkPro',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Agregar apodo (opcional)',
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter
                                      .singleLineFormatter
                                ],
                                keyboardType: TextInputType.text,
                                maxLength: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 90.0),
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 25.0),
                          child: GeneralButtonWidget(text: 'Confirmar'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
  }
}
