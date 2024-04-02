import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String text;
  final double sizefont;
  final Color colores;

  const ListItem({super.key, required this.text, required this.sizefont, required this.colores});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: colores,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 3),
          Expanded(
            child: Text(
              text.toUpperCase(),
              style: TextStyle(fontSize: sizefont, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
