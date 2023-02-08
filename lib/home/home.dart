import 'package:flutter/material.dart';
import 'package:perfil/components/card.dart';
import 'package:perfil/home/homeController.dart';
import 'package:perfil/user/userMode.dart';

import '../components/list.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
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
              FutureBuilder<List<User>>(
                future: controller.getAllUser(),
                builder: (ctx, snapshot) {
                  if (snapshot.hasData) {
                    final listUser = snapshot.data!;
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.70,
                      child: Column(
                        children: listUser
                            .map(
                              (user) => CardName(
                                  name: user.nome,
                                  idade: user.idade,
                                  userId: user.id!),
                            )
                            .toList(),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Text(
                      'Erro inesperado',
                      style: TextStyle(fontSize: 30),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
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
