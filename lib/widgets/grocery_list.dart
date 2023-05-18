import 'package:flutter/material.dart';
import 'package:shop_app_forms/widgets/new_item.dart';
import '../data/dummy_items.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void _additem() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((context) => const NewItem()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [
          IconButton(
            onPressed: _additem,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (ctx, i) => ListTile(
          title: Text(groceryItems[i].name),
          leading: Container(
            width: 24,
            height: 24,
            color: groceryItems[i].category.color,
          ),
          trailing: Text(
            groceryItems[i].quantity.toString(),
          ),
        ),
      ),
    );
  }
}
