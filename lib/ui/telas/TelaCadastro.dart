import 'package:filmes_preferidos/repository/filme_repository.dart';
import 'package:filmes_preferidos/ui/widgets/InputPersonalizado.dart';
import 'package:flutter/material.dart';

import '../../model/Filme.dart';
import '../widgets/BotaoCustomizado.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  var _formKey = GlobalKey<FormState>();
  FilmeRepository repository = FilmeRepository();
  TextEditingController tituloEditingController = TextEditingController();
  TextEditingController categoriaEditingController = TextEditingController();
  TextEditingController anoLancamentoEditingController =
  TextEditingController();

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
              InputPersonalizado(
                hint: "Título",
                textEditingController: tituloEditingController,
              ),
              InputPersonalizado(
                hint: "Ano Lançamento",
                tipoTeclado: TextInputType.number,
                textEditingController: anoLancamentoEditingController,
              ),
              InputPersonalizado(
                hint: "Categoria",
                textEditingController: categoriaEditingController,
              ),
              BotaoCustomizado(
                "Cadastrar",
                funcaoDoBotao: () async {
                  Filme f = Filme(
                      tituloEditingController.text,
                      anoLancamento: anoLancamentoEditingController.text,
                      categoria: categoriaEditingController.text);
                  f = await repository.save(f);
                  Navigator.pop(context, f.id);
                },
              ),
              BotaoCustomizado(
                "Cancelar",
                corBotao: Colors.black26,
                funcaoDoBotao: () => Navigator.pop(context, 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
