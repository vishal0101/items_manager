import 'package:flutter/material.dart';
import 'package:items_manager/helper/inputmap.dart';
import 'package:items_manager/widgets/custom_color.dart';
import 'package:items_manager/widgets/widget.dart';
import 'generated_list.dart';

import 'body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String itemName = "";
  String itemQuantity = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialogCustom(context);
        },
        child: const Icon(Icons.add),
        backgroundColor: CustomColor.themeColor,
      ),
    );
  }

  showDialogCustom(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("ADD ITEM"),
            content: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    onChanged: (value) {
                      itemName = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter the name";
                      }
                      if (double.tryParse(value) != null) {
                        return "Name cannot be a number";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      itemQuantity = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter the Quantity";
                      }
                      if (double.tryParse(value) == null) {
                        return "Enter a number";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(hintText: "Quantity"),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  setState(() {
                    if (formKey.currentState!.validate()) {
                      InputMap.setData(itemName, int.parse(itemQuantity));
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    }
                  });
                },
                child: const Text("ADD"),
                style: customTextButtonStyle(),
              ),
            ],
          );
        });
  }
}
