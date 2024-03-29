import 'package:flutter/material.dart';
import 'package:perfil/user/userMode.dart';

class CardName extends StatelessWidget {
  final String name;
  final int idade;
  final String userId;
  final void Function()? onDelete;
  const CardName({
    Key? key,
    required this.name,
    required this.idade,
    required this.userId,
    required this.onDelete,
  }) : super(key: key);

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
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 20),
                ),
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
            child: Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/cadastro',
                        arguments: User(nome: name, idade: idade, id: userId));
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
