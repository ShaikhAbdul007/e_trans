import 'package:get_storage/get_storage.dart';

class CacheManager {
  final userDetails = GetStorage();

  saveUserName(userName) {
    userDetails.write('saveId', userName);
  }

  retrieveUserName() {
    return userDetails.read('saveId');
  }

  saveLogIn(bool value) {
    return userDetails.write('isLogged', value);
  }

  Future<bool> checkUserLogged() async {
    userDetails.writeIfNull('isLogged', false);
    return userDetails.read("isLogged");
  }

  removeUser() {
    userDetails.remove('saveId');
  }
}
