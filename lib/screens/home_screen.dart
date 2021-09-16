import 'package:flutter/material.dart';
import 'package:items_manager/helper/inputmap.dart';
import 'package:items_manager/widgets/custom_color.dart';
import 'package:items_manager/widgets/widgets.dart';
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

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text("Items Manager"),
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

  showDialogCustom(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("ADD ITEM"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) {
                    itemName = value;
                  },
                  decoration: const InputDecoration(hintText: "Name"),
                ),
                TextField(
                  onChanged: (value) {
                    itemQuantity = value;
                  },
                  decoration: const InputDecoration(hintText: "Quantity"),
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  setState(() {
                    InputMap.setData(itemName, int.parse(itemQuantity));
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  });
                },
                child: const Text("ADD"),
              ),
            ],
          );
        });
  }
}
