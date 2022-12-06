import 'package:get/get.dart';
import 'package:trasn_human_resource_managment/cache_manager/cache_manager.dart';
import '../respository/auth_repository.dart';

class LoginViewModel extends GetxController with CacheManager {
  final auth = AuthRepository();
  RxBool isLoading = false.obs;
  RxBool isPassLoading = false.obs;
  RxBool passwordSecure = true.obs;

  void passwordSecureToggle() {
    passwordSecure.value = !passwordSecure.value;
  }

  Future<String> getLoginData(dynamic userName, dynamic passWord) async {
    isLoading.value = true;
    final response = await auth.getLoginApi(userName, passWord).then((value) {
      return value;
    }).onError((error, stackTrace) {
      isLoading.value = false;
      throw Get.snackbar("Error", "SomeThing Went Wrong");
    });
    isLoading.value = false;
    return response;
  }

  Future<String> getForgotData(dynamic userName) async {
    isPassLoading.value = true;
    final response = await auth.getForgotApi(userName).then((value) {
      return value;
    }).onError((error, stackTrace) {
      isPassLoading.value = false;
      throw Get.snackbar("Error", "SomeThing Went Wrong");
    });
    isPassLoading.value = false;
    return response;
  }

  Future<String> getSecurityCode(dynamic userName) async {
    final response = await auth.getSecurityApi(userName).then((value) {
      return value;
    }).onError((error, stackTrace) {
      throw Get.snackbar("Error", "SomeThing Went Wrong");
    });
    return response;
  }
}
