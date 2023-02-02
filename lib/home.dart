import 'package:flutter/material.dart';
import 'package:perfil/userMode.dart';

import 'list.dart';

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
                child: Text(listUser?[0].nome ?? 'lista vazia'),
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
