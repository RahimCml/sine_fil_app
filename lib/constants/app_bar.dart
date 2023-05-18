import 'package:flutter/material.dart';
import '../delegates/custom_search_delegate.dart';

class AppBarConstant {
  static AppBar appBar(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(),
            );
          },
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}
