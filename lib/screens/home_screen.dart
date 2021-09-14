import 'package:flutter/material.dart';

import 'body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Items Manager"),
      leading: GestureDetector(onTap: () {}, child: Icon(Icons.menu)),
    );
  }
}
