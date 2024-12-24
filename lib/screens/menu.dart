import 'package:flutter/material.dart';
import 'package:bunnies_store_mobile/widgets/left_drawer.dart';
import 'package:bunnies_store_mobile/screens/add_item_form.dart';

class MyHomePage extends StatelessWidget {
  final List<ItemHomepage> items = [
    ItemHomepage("View Product List", Icons.list, Color(0xFFA7C7E7)), // pastel blue
    ItemHomepage("Add Product", Icons.add, Color(0xFFA8E6CF)), // pastel green
    ItemHomepage("Logout", Icons.logout, Color(0xFFDBC3E6)), // pastel purple
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🐰 bunnies store 🐰"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items.map((item) => Expanded(child: ItemCard(item))).toList(),
        ),
      ),
    );
  }
}

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: item.color,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            // Check the item name and navigate if it's "Add Product"
            if (item.name == "Add Product") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddItemFormPage()),
              );
            } else {
              String message = "Kamu telah menekan tombol ${item.name}!";
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text(message)));
            }
          },
          child: Container(
            height: 150, // Optional: Set a fixed height
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item.icon, color: Colors.white, size: 40.0),
                  const SizedBox(height: 8),
                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
