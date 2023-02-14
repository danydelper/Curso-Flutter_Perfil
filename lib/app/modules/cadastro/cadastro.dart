import 'package:flutter/material.dart';
import 'package:perfil/app/modules/cadastro/cadastroController.dart';
import 'package:perfil/user/userMode.dart';

class CadastroView extends StatelessWidget {
  CadastroView({super.key, required this.user});

  final User? user;
  final controller = CadastroController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        actions: [
          FutureBuilder(
            future: controller.getUser(user?.id),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                if (user?.id != null) {
                  return const Icon(Icons.edit);
                } else {
                  return const Icon(Icons.person);
                }
              } else if (snapshot.hasError) {
                return const Icon(Icons.error);
              } else {
                return const Text('Carregando...');
              }
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    TextField(
                      controller: controller.nameController,
                      decoration: const InputDecoration(
                        label: Text('Name'),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: controller.idadeController,
                      decoration: const InputDecoration(
                        label: Text('Idade'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton(
                onPressed: () {
                  controller.saveUser(user?.id, context: context);
                },
                child: Visibility(
                  visible: user == null,
                  // ignore: sort_child_properties_last
                  child: const Text('Cadastrar'),
                  replacement: const Text('Editar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
