import 'package:filmes_preferidos/ui/widgets/InputPersonalizado.dart';
import 'package:flutter/material.dart';

import '../widgets/BotaoCustomizado.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro"), backgroundColor: Colors.amber),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputPersonalizado(hint: "Título"),
              InputPersonalizado(
                hint: "Ano Lançamento",
                tipoTeclado: TextInputType.number,
              ),
              InputPersonalizado(hint: "Categoria"),
              BotaoCustomizado(
                "Cadastrar",
                funcaoDoBotao: () => print("Cadastrou"),
              ),
              BotaoCustomizado(
                "Cancelar",
                corBotao: Colors.black26,
                funcaoDoBotao: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
