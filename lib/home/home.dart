import 'package:flutter/material.dart';
import 'package:perfil/components/card.dart';
import 'package:perfil/user/userMode.dart';

import '../components/list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final listUser = ModalRoute.of(context)!.settings.arguments as List<User>?;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: ListMenu.get(context),
        ),
      ),
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.70,
                child: Column(
                  children: listUser
                          ?.map((user) =>
                              CardName(name: user.nome, idade: user.idade))
                          .toList() ??
                      [],
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/cadastro');
                },
                child: const Text('Acessar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
