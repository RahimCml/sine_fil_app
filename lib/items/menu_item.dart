import 'package:flutter/material.dart';

import '../constants/color.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const MenuItem({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: GestureDetector(
        child: Row(
          children: [
            Icon(
              icon,
              color: ConstantColor.kMainColor,
              size: 30,
            ),
            const SizedBox(width: 16),
            Expanded(
                child: Text(
              title,
              style: const TextStyle(fontSize: 12, color: Color(0xFFFFD255)),
            ))
          ],
        ),
      ),
    );
  }
}
