import 'package:flutter/material.dart';
import 'package:fresh_start/core/presentation/views/Transfers/new_contact_view.dart';

class RoundedButtonWidget extends StatelessWidget {
  const RoundedButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NewContactView()));
      },
      child: Container(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
        child: const Row(
          children: [
            Icon(
              Icons.add_circle_outline,
              size: 50.0,
              color: Color(0XFF034F8D),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Nuevo",
                style: TextStyle(
                    fontFamily: 'MarkPro',
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF034F8D)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
