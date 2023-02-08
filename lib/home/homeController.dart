import 'package:perfil/data/api.dart';
import '../user/userMode.dart';

class HomeController {
  final ApiService _apiService = ApiService();

  Future<List<User>> getAllUser() async {
    return await _apiService.getAll("user");
  }
}
