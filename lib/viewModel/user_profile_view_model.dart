import 'package:get/get.dart';
import '../cache_manager/cache_manager.dart';
import '../model/user_profile_model.dart';
import '../respository/auth_repository.dart';

class UserProfileViewModel extends GetxController with CacheManager {
  final auth = AuthRepository();

  Future<UserProfileModel> getUserProfileData(dynamic userName) {
    var reposne = auth.userProfile(userName).then((value) {
      return value;
    }).onError((error, stackTrace) {
      throw error.toString();
    });
    return reposne;
  }
}
