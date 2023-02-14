// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:perfil/repository/user_repository.dart';
import 'package:perfil/user/userMode.dart';

import '../../../repository/user_repository_interface.dart';

class CadastroController {
  final IUserRepository _userRepository = UserRepository();
  final nameController = TextEditingController();
  final idadeController = TextEditingController();

  Future<bool> addUser({required BuildContext context}) async {
    return await _userRepository.postUser(
        data: {"name": nameController.text, "idade": idadeController.text});
  }

  Future<User> getUser(String? userId) async {
    if (userId != null) {
      final user = await _userRepository.getFindUser(id: userId);

      nameController.text = user.nome;
      idadeController.text = user.idade.toString();
      return user;
    } else {
      return User(nome: "", idade: 0);
    }
  }

  Future<bool> editUser(
      {required String userId, required BuildContext context}) async {
    return await _userRepository.putUser(
        data: {"name": nameController.text, "idade": idadeController.text},
        id: userId);
  }

  Future<void> saveUser(String? userId, {required BuildContext context}) async {
    var isTrue = false;

    if (userId == null) {
      isTrue = await addUser(context: context);
    } else {
      isTrue = await editUser(userId: userId, context: context);
    }

    if (isTrue) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
    }
  }
}
