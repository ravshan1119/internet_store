
import 'package:internet_store/data/local/storage_repository.dart';
import 'package:internet_store/data/models/universal_model.dart';
import 'package:internet_store/data/network/providers/api_provider.dart';

class LoginRepo {
  LoginRepo({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<bool> loginUser({
    required String username,
    required String password,
  }) async {
    UniversalResponse universalResponse =
        await apiProvider.loginUser(username: username, password: password);
    if (universalResponse.error.isEmpty) {
      await StorageRepository.putString("token", universalResponse.data as String);
      return true;
    }
    return false;
  }
}
