// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:perfil/data/api.dart';
import 'package:perfil/user/userMode.dart';

class CadastroController {
  final ApiService _apiService = ApiService();
  final nameController = TextEditingController();
  final idadeController = TextEditingController();

  Future<void> addUser({required BuildContext context}) async {
    final isTrue = await _apiService.post("user",
        data: {"name": nameController.text, "idade": idadeController.text});

    if (isTrue) {
      Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
    }
  }

  Future<User> getUser(String? userId) async {
    if (userId != null) {
      final user = await _apiService.getFind("user", id: userId);

      nameController.text = user.nome;
      idadeController.text = user.idade.toString();
      return user;
    } else {
      return User(nome: "", idade: 0);
    }
  }
}
