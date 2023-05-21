import 'package:flutter/material.dart';

class CategoryComponent extends StatelessWidget {
  final String categoryName;

  const CategoryComponent({Key? key, required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Chip(
        label: Text(
          categoryName,
          style: const TextStyle(color: Color(0xFFFFD255)),
        ),
        backgroundColor: const Color(0xFF444A54),
        padding: const EdgeInsets.only(left: 12, right: 12),
      ),
    );
  }
}
