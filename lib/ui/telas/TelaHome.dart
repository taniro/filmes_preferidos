import 'package:flutter/material.dart';

class TelaHome extends StatelessWidget {
  const TelaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmes Prediletos"),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: () => print("clicou"),
            icon: Icon(Icons.accessibility),
          ),
        ],
      ),
      body: Placeholder(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/cadastro");
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
