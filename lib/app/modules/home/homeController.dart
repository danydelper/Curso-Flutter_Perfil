import 'package:perfil/repository/user_repository.dart';
import 'package:perfil/repository/user_repository_interface.dart';
import '../../../user/userMode.dart';

class HomeController {
  final IUserRepository _userRepository = UserRepository();

  Future<List<User>> getAllUser() async {
    return await _userRepository.getAll();
  }

  Future<void> deleteUser(String userId) async {
    await _userRepository.deleteUser(id: userId);
  }
}
