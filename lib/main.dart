import 'package:filmes_preferidos/ui/telas/TelaCadastro.dart';
import 'package:filmes_preferidos/ui/telas/TelaHome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialAppConfigurer("Filmes Preferidos"));
}

class MaterialAppConfigurer extends StatelessWidget {

  final String tituloDoApp;
  const MaterialAppConfigurer(this.tituloDoApp, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: tituloDoApp,
      routes: {
        "/": (context) => TelaHome(),
        "/cadastro": (context) => TelaCadastro()
      },
    );
  }
}