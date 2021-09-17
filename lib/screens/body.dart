import 'package:flutter/material.dart';
import 'package:items_manager/helper/inputmap.dart';
import 'package:items_manager/widgets/listtile_builder.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    var itemKeys = InputMap.item.keys.toList();

    return ListView.builder(
        itemCount: itemKeys.length,
        itemBuilder: (context, index) {
          return listTile(context, itemKeys[index],
              InputMap.item[itemKeys[index]].toString());
        });
  }
}
