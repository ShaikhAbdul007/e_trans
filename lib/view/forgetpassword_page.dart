import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trasn_human_resource_managment/view/login_page.dart';
import '../viewModel/login_view_model.dart';
import '../widget/helper.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isdark = Theme.of(context).brightness == Brightness.dark;
    LoginViewModel loginViewModel = Get.put(LoginViewModel());
    TextEditingController forgotEmpId = TextEditingController();
    TextStyle? style = Theme.of(context).textTheme.bodyText2;
    TextStyle? alertStyle = Theme.of(context).textTheme.bodyText2;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: isdark
            ? const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    colors: [
                    Colors.black,
                    Colors.black26
                    //  Colors.blueAccent.shade100,
                  ]))
            : const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    colors: [
                    Color(0xFFCC9900),
                    Color(0xffff9900),
                    Color(0xFFCC9900),
                    //  Colors.blueAccent.shade100,
                  ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Forgot", style: Theme.of(context).textTheme.headline5),
                  setHeight(2),
                  Text("Password ?",
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: isdark ? Colors.white : Colors.black)),
                  setHeight(5),
                  Text(
                      'Do not worry! it happens. Please enter the Emp id associated with office Id card.',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontSize: 14.sp)),
                ],
              ),
            ),
            setHeight(25),
            Container(
                height: 43.h,
                width: 300.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: CustomTextField(
                  suffixIcon: Icon(
                    Icons.perm_identity_outlined,
                    color: isdark ? Colors.black : null,
                  ),
                  hintText: "Emp id",
                  controller: forgotEmpId,
                )),
            setHeight(30),
            Obx(
              () => CustomButton(
                isLoading: loginViewModel.isPassLoading.value,
                iconData: Icons.email_outlined,
                onTap: () async {
                  if (forgotEmpId.text.isEmpty) {
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
                  } else {
                    var response =
                        await loginViewModel.getForgotData(forgotEmpId.text);
                    Get.defaultDialog(
                        barrierDismissible: false,
                        actions: [
                          CustomButton(
                              context: context,
                              onTap: () {
                                Get.offAll(() => const LoginScreen());
                              },
                              buttonText: "Ok")
                        ],
                        backgroundColor: Colors.grey.shade100,
                        title: 'Alert',
                        content: Column(
                          children: [
                            if (response == 'No DATA FOUND') ...{
                              Text(
                                  'Employee Id => ${forgotEmpId.text} \n\n$response \n\nPlease Contact With Hr Team for Password..',
                                  style: style)
                            } else ...{
                              Text(
                                'Employee Id  => ${forgotEmpId.text}\n\nPlease ${response.substring(6, response.length)} \n\nfor Password !!',
                                style: style,
                              )
                            }
                          ],
                        ),
                        titleStyle: alertStyle,
                        radius: 20.r);
                  }
                },
                context: context,
                buttonText: 'Send Password',
              ),
            )
          ],
        ),
      ),
    );
  }
}
