import 'package:flutter/material.dart';
import 'package:items_manager/helper/inputmap.dart';
import 'package:items_manager/screens/home_screen.dart';

Widget listTile(BuildContext context, String titleName, String val) {
  return Card(
    child: ListTile(
      title: Text(titleName),
      trailing: Text(val),
      onTap: () {
        showDialogCustom(context, titleName);
      },
    ),
  );
}

showDialogCustom(BuildContext context, String key) {
  String newValue = "";
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("EDIT QUANTITY"),
          content: TextField(
            onChanged: (value) {
              newValue = value;
            },
            decoration: const InputDecoration(hintText: "Enter new value"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                InputMap.item[key] = int.parse(newValue);
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
              child: const Text("Edit"),
            ),
          ],
        );
      });
}
