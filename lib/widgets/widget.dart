import 'package:flutter/material.dart';
import 'package:items_manager/screens/generated_list.dart';

import 'custom_color.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: const Text(
      "Items Manager",
    ),
    // leading: GestureDetector(onTap: () {}, child: Icon(Icons.menu)),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GeneratedList()));
            },
            icon: const Icon(Icons.assignment)),
      )
    ],
  );
}

customTextButtonStyle() {
  return (TextButton.styleFrom(
      primary: CustomColor.whiteColor,
      textStyle: const TextStyle(fontSize: 16.0),
      padding: const EdgeInsets.all(8.0),
      backgroundColor: CustomColor.themeColor));
}

customMainTextStyle() {
  return (const TextStyle(fontSize: 20));
}
