import 'package:flutter/material.dart';
import 'package:items_manager/helper/inputmap.dart';
import 'package:items_manager/screens/home_screen.dart';
import 'package:items_manager/widgets/widget.dart';

Widget listTile(BuildContext context, String titleName, String val) {
  return Card(
    child: ListTile(
      title: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          titleName,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      trailing: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          val,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      onTap: () {
        showDialogCustom(context, titleName);
      },
    ),
  );
}

showDialogCustom(BuildContext context, String key) {
  final formKey = GlobalKey<FormState>();
  String newValue = "";
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("EDIT QUANTITY"),
          content: Form(
            key: formKey,
            child: TextFormField(
              onChanged: (value) {
                newValue = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter the value";
                }
                if (double.tryParse(value) == null) {
                  return "Enter a number";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: "New Quantity"),
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    InputMap.item[key] = int.parse(newValue);
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  }
                },
                child: const Text("Edit"),
                style: customTextButtonStyle()),
          ],
        );
      });
}
