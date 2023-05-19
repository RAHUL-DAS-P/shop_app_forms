import 'package:flutter/material.dart';
import 'package:shop_app_forms/models/grocery_item.dart';
import 'package:shop_app_forms/widgets/new_item.dart';
import '../data/dummy_items.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];
  void _additem() async {
    final newItem = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((context) => const NewItem()),
      ),
    );

    if (newItem == null) {}

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
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
      body: _groceryItems.isEmpty
          ? const Center(
              child: Text("No Grocery Item !"),
            )
          : ListView.builder(
              itemCount: _groceryItems.length,
              itemBuilder: (ctx, i) => Dismissible(
                key: ValueKey(_groceryItems[i].id),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  _removeItem(_groceryItems[i]);
                },
                child: ListTile(
                  title: Text(_groceryItems[i].name),
                  leading: Container(
                    width: 24,
                    height: 24,
                    color: _groceryItems[i].category.color,
                  ),
                  trailing: Text(
                    _groceryItems[i].quantity.toString(),
                  ),
                ),
              ),
            ),
    );
  }
}
