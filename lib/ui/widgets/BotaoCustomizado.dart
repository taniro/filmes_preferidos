import 'package:flutter/material.dart';

class BotaoCustomizado extends StatelessWidget {

  String text;
  void Function()? funcaoDoBotao;
  Color? corBotao;

  BotaoCustomizado(this.text, {
    super.key,
    this.funcaoDoBotao,
    this.corBotao
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: ()=> {
          funcaoDoBotao!()
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: corBotao ?? Colors.amber,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
