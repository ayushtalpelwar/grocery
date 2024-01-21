import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grossery/data/dummy_items.dart';
import 'package:grossery/widgets/new_item.dart';

import '../models/grocery_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];
  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (context) => NewItem(),
      ),
    );
    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item){
    setState(() {
      _groceryItems.remove(item);
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget Body = _groceryItems.isEmpty
        ? Center(
            child: Text("No item"),
          )
        : ListView.builder(
            itemCount: _groceryItems.length,
            itemBuilder: (context, index) => Dismissible(
              onDismissed: (direction) {
                _removeItem(_groceryItems[index]);
              },
              key: ValueKey(_groceryItems[index].id),
              child: ListTile(
                title: Text(_groceryItems[index].name),
                leading: Container(
                  width: 24,
                  height: 24,
                  color: _groceryItems[index].category.color,
                ),
                trailing: Text(_groceryItems[index].quantity.toString()),
              ),
            ),
          );
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Grocery items"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Body,
    );
  }
}
