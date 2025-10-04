import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onAdd;

  const ItemCard({super.key, required this.title, required this.subtitle, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: ElevatedButton(
          onPressed: onAdd,
          child: const Text("Add"),
        ),
      ),
    );
  }
}
