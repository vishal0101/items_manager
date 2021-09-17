import 'package:flutter/material.dart';
import 'package:items_manager/helper/inputmap.dart';
import 'package:items_manager/widgets/listtile_builder.dart';
import 'package:items_manager/widgets/widget.dart';

class GeneratedList extends StatelessWidget {
  const GeneratedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map selectedItem = {};
    int minVal = 2;
    InputMap.item.forEach((key, value) {
      if (value < minVal) {
        selectedItem[key] = value;
      }
    });
    print(selectedItem);
    var itemKeys = selectedItem.keys.toList();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Generated List"),
        ),
        body: ListView.builder(
            itemCount: itemKeys.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      itemKeys[index],
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              );
            }));
  }
}
