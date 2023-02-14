import 'package:perfil/repository/user_repository_interface.dart';
import 'package:perfil/user/userMode.dart';

class UserRepository implements IUserRepository {
  @override
  Future<void> deleteUser({required String id}) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<User> getFindUser({required String id}) {
    // TODO: implement getFindUser
    throw UnimplementedError();
  }

  @override
  Future<bool> postUser({required Map<String, Object?> data}) {
    // TODO: implement postUser
    throw UnimplementedError();
  }

  @override
  Future<bool> putUser(
      {required Map<String, Object?> data, required String id}) {
    // TODO: implement putUser
    throw UnimplementedError();
  }
}
