import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perfil/userMode.dart';

class CardName extends StatelessWidget {
  final String name;
  final int idade;
  const CardName({Key? key, required this.name, required this.idade})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                '$idade anos',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/cadastro',
                    arguments: User(nome: name, idade: idade));
              },
              icon: const Icon(Icons.edit),
            ),
          ),
        ],
      ),
    );
  }
}
