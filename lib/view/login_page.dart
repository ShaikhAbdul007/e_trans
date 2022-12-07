import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trasn_human_resource_managment/view/dashboard_page.dart';
import 'package:trasn_human_resource_managment/view/forgetpassword_page.dart';
import '../viewModel/login_view_model.dart';
import '../widget/helper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginViewModel loginViewModel = Get.put(LoginViewModel());
    TextEditingController empController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextStyle? style = Theme.of(context).textTheme.headline6;
    final userDate = GetStorage();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
              Color(0xFFCC9900),
              Color(0xffff9900),
              Color(0xFFCC9900),
              //  Colors.blueAccent.shade100,
            ])),
        child: ListView(
          children: [
            Container(
                margin: EdgeInsets.only(left: 100.w, top: 100.h),
                child: Text("Welcome",
                    style: Theme.of(context).textTheme.headline4)),
            setHeight(5),
            Container(
              margin: EdgeInsets.only(left: 80.w),
              child: Text("Glad to see you",
                  style: Theme.of(context).textTheme.headline5),
            ),
            Padding(
              padding: EdgeInsets.only(left: 42.w, right: 42.w, top: 50.h),
              child: Column(
                children: [
                  Container(
                      height: 43.h,
                      width: 290.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.15),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: CustomTextField(
                        suffixIcon: const Icon(Icons.perm_identity_outlined),
                        hintText: "Emp id",
                        controller: empController,
                      )),
                  setHeight(35),
                  Container(
                    height: 43.h,
                    width: 290.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Obx(
                      () => CustomTextField(
                        obscureText: loginViewModel.passwordSecure.value,
                        suffixIcon: IconButton(
                          icon: loginViewModel.passwordSecure.value
                              ? const Icon(Icons.lock_outline)
                              : const Icon(Icons.lock_open_outlined),
                          onPressed: () {
                            print("tap");
                            loginViewModel.passwordSecureToggle();
                          },
                        ),
                        hintText: "password",
                        controller: passController,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            setHeight(50),
            Obx(
              () => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70.w),
                  child: CustomButton(
                    isLoading: loginViewModel.isLoading.value,
                    onTap: () async {
                      if (empController.text.isEmpty) {
                        Get.snackbar(
                          "",
                          '',
                          titleText: Text(
                            'Error',
                            style: style,
                          ),
                          messageText: Text(
                            'Enter the Employee Id',
                            style: style,
                          ),
                          icon: const Image(
                              image: AssetImage('asset/crying.png'),
                              fit: BoxFit.fitWidth),
                        );
                      } else if (passController.text.isEmpty) {
                        Get.snackbar(
                          "",
                          '',
                          titleText: Text(
                            'Error',
                            style: style,
                          ),
                          messageText: Text(
                            'Enter the Password',
                            style: style,
                          ),
                          icon: const Image(
                              image: AssetImage('asset/crying.png'),
                              fit: BoxFit.fitWidth),
                        );
                      } else {
                        var response = await loginViewModel.getLoginData(
                            empController.text, passController.text);
                        loginViewModel.saveLogIn(true);
                        loginViewModel.saveUserName(empController.text);

                        if (response == 'LOGIN SUCCESSFULLY') {
                          Get.snackbar(
                            "",
                            '',
                            titleText: Text(
                              'Success',
                              style: style,
                            ),
                            messageText: Text(
                              'Login Successfully!!!',
                              style: style,
                            ),
                            showProgressIndicator: true,
                            icon: const Image(
                                image: AssetImage('asset/successEmoji.png'),
                                fit: BoxFit.fitWidth),
                          );
                          Future.delayed(const Duration(seconds: 2), () {
                            Get.offAll(() => const DashBoardPage());
                          });
                        } else if (response == 'LOGIN FAILED') {
                          Get.snackbar('', '',
                              icon: const Image(
                                  image: AssetImage('asset/crying.png'),
                                  fit: BoxFit.fitWidth),
                              titleText: Text(
                                'Error',
                                style: style,
                              ),
                              messageText: Text(
                                'Login Failed Enter Correct Details ',
                                style: style,
                              ));
                        } else {
                          Get.snackbar(
                            '',
                            '',
                            titleText: Text(
                              'Error',
                              style: style,
                            ),
                            messageText: Text(
                              'Unknown User Please Contact Technical Team',
                              style: style,
                            ),
                            icon: const Image(
                                image: AssetImage(
                                  'asset/thinking.png',
                                ),
                                fit: BoxFit.fitHeight),
                          );
                        }
                      }
                    },
                    context: context,
                    buttonText: 'Login',
                  )),
            ),
            setHeight(10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 110.w),
              child: InkWell(
                onTap: () {
                  Get.to(() => const ForgotPasswordScreen());
                },
                child: Text(
                  "Forgot Password",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 110.w, right: 120.w),
                child: const Divider(
                  color: Colors.white,
                  thickness: 1.5,
                  height: 1.2,
                )),
          ],
        ),
      ),
    );
  }
}
// Material(
//   elevation: 10,
//   borderRadius: BorderRadius.circular(8.r),
//   child: customTextField(
//     hintText: "Emp",
//   ),
// ),
// setHeight(40),
// Material(
//   elevation: 10,
//   borderRadius: BorderRadius.circular(8.r),
//   child: customTextField(
//     hintText: "password",
//   ),
// ),
// setHeight(15),
