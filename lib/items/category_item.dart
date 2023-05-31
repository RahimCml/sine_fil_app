import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String name;

  const CategoryItem({Key? key, required this.name,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){},
        child: Column(
          children: [
              const SizedBox(height: 5,),
              Text(name, style: const TextStyle(fontSize: 12),)
          ]
        ),
    );
  }
}