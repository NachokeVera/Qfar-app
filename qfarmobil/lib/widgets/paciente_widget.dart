import 'package:flutter/material.dart';

class PacienteWidget extends StatelessWidget {
  const PacienteWidget(
      {super.key,
      required this.id,
      required this.esperando,
      required this.peso});

  final int id;
  final bool esperando;
  final int peso;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Container(
          margin: const EdgeInsets.fromLTRB(30, 30, 30, 30),
          decoration: const BoxDecoration(
            color: Color.fromARGB(80, 209, 116, 116),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('id: $id'),
              Text('esperando: $esperando'),
              Text('peso: $peso'),
            ],
          )),
    );
  }
}
