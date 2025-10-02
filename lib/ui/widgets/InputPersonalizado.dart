
import 'package:flutter/material.dart';

class InputPersonalizado extends StatelessWidget {

  String hint;
  TextInputType? tipoTeclado;
  TextEditingController? textEditingController;

  InputPersonalizado({
    super.key,
    required this.hint,
    this.tipoTeclado,
    this.textEditingController
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: tipoTeclado,
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusColor: Colors.white,
          filled: true,
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black38),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
