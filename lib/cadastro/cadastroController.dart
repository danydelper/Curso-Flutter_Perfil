// ignore: file_names
import 'package:perfil/user/userMode.dart';
import 'package:perfil/user/userService.dart';

class CadastroController {
  final UserService _userService = UserService();

  List<User> addUser({required String nome, required String idade}) {
    return _userService.addUser(nome: nome, idade: idade);
  }
}
