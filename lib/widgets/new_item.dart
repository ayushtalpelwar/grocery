import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a New Item"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text("DATA"),
      ),
    );
  }
}
