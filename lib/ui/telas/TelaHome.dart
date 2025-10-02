import 'package:filmes_preferidos/repository/filme_repository.dart';
import 'package:flutter/material.dart';

import '../../model/Filme.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  FilmeRepository repository = FilmeRepository();
  late Future<List> listaFilmes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listaFilmes = repository.getAll();
  }

  Future<void> navigateToCreate() async {
    var retorno = await Navigator.pushNamed(context, "/cadastro");
    if (!mounted) {
      return;
    }

    print(retorno);
    if (retorno != 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Durations.extralong4,
          content: Text("Cadastrado"),
          action: SnackBarAction(label: "Cancelar", onPressed: () {
            repository.delete(retorno as int);
            setState(() {
              listaFilmes = repository.getAll();
            });
          }),
        ),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Cancelado")));
    }
    setState(() {
      listaFilmes = repository.getAll();
    });
  }

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
      body: /*ListView(
        children: [
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry A')),
          ),
        ],
      ),*/ FutureBuilder(
        future: listaFilmes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onLongPress: (){
                    repository.delete(snapshot.data![i].id);
                    setState(() {
                      listaFilmes = repository.getAll();
                    });
                  },
                  child: Card(
                    child: SizedBox(
                      height: 50,
                      child: Center(child: Text("${snapshot.data![i].titulo}")),
                    ),
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToCreate,
        child: Icon(Icons.add),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
