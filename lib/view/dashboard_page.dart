import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trasn_human_resource_managment/color/appcolor.dart';
import 'package:trasn_human_resource_managment/viewModel/login_view_model.dart';

import '../future_component/security_code_component.dart';
import '../widget/helper.dart';
import 'login_page.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  late final Future<String> security;

  LoginViewModel loginViewModel = Get.put(LoginViewModel());

  @override
  void initState() {
    var userName = loginViewModel.retrieveUserName();
    // TODO: implement initState
    security = loginViewModel.getSecurityCode(userName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final style =
        Theme.of(context).textTheme.headline4?.copyWith(fontSize: 20.sp);
    final securityStyle = Theme.of(context).textTheme.headline4?.copyWith(
        fontSize: 20.sp,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        shadows: const [Shadow(color: Colors.black45, blurRadius: 8)]);
    final labelStyle = Theme.of(context).textTheme.headline4?.copyWith(
        fontSize: 15.sp, color: Colors.black, fontWeight: FontWeight.bold);
    final errorStyle = Theme.of(context)
        .textTheme
        .headline6
        ?.copyWith(fontSize: 16.sp, color: Colors.red);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DashBoard',
          style: Theme.of(context).textTheme.headline5,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: InkWell(
              onTap: () => getDialog(),
              child: Icon(
                Icons.logout,
                size: 20.sp,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var username = loginViewModel.retrieveUserName();
          showModalBottomSheet(
              context: context,
              isDismissible: false,
              builder: (context) => CustomBottomSheet(
                  title: "Security Code",
                  onTap: () {
                    Get.back();
                  },
                  child: FutureBuilder(
                      future: loginViewModel.getSecurityCode(username),
                      builder: ((context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: Padding(
                            padding: EdgeInsets.only(top: 50.h, bottom: 50.h),
                            child: const CircularProgressIndicator(),
                          ));
                        } else if (snapshot.connectionState ==
                            ConnectionState.none) {
                          return Center(
                              child: Text(
                            "Can't Connect to Server...",
                            style: style,
                          ));
                        } else if (snapshot.connectionState ==
                                ConnectionState.done ||
                            snapshot.connectionState ==
                                ConnectionState.active) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.error_outline,
                                      color: Colors.red),
                                  setHeight(10),
                                  Text(snapshot.error.toString(),
                                      style: errorStyle)
                                ],
                              ),
                            );
                          } else if (snapshot.hasData) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                children: [
                                  Container(
                                    height: 50.h,
                                    width: 300.w,
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              blurRadius: 5,
                                              offset: const Offset(0, 5))
                                        ]),
                                    child: Row(
                                      children: [
                                        Text('Security Code',
                                            style: labelStyle),
                                        setWidth(10),
                                        Icon(
                                          Icons.arrow_right_alt,
                                          size: 25.sp,
                                        ),
                                        setWidth(10),
                                        Text(snapshot.data.toString(),
                                            style: securityStyle)
                                      ],
                                    ),
                                  ),
                                  setHeight(20),
                                  CustomButton(
                                      context: context,
                                      onTap: () {
                                        Get.back();
                                      },
                                      buttonText: "Ok"),
                                  setHeight(40),
                                ],
                              ),
                            );
                          } else {
                            return Center(
                                child: Text(
                              "SomeThing Went Wrong, Please try Again",
                              style: style,
                            ));
                          }
                        } else {
                          return Center(
                              child: Text(
                            "SomeThing Went Wrong,Please try Again",
                            style: style,
                          ));
                        }
                      }))));
        },
        child: const Image(
          image: AssetImage('asset/chatbot 1.png'),
        ),
      ),
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0xFFCC9900),
                Color(0xffff9900),
                Color(0xFFCC9900),
              ])),
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.only(top: 300, left: 80),
              child: Text(
                'Comming Soon',
                style: labelStyle,
              ),
            )
          ]),
        ),
      ),
    );
  }

  getDialog() => Get.defaultDialog(
      barrierDismissible: true,
      backgroundColor: Colors.grey.shade100,
      title: 'Alert',
      middleText: 'Are you want to logout ?',
      titleStyle: Theme.of(context).textTheme.headline4?.copyWith(
          fontSize: 15.sp, color: Colors.black, fontWeight: FontWeight.bold),
      middleTextStyle: Theme.of(context)
          .textTheme
          .headline6
          ?.copyWith(fontSize: 16.sp, color: Colors.red),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Row(
            children: [
              Obx(
                () => TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black)),
                    onPressed: () {
                      loginViewModel.isLoading.value = true;
                      Future.delayed(const Duration(seconds: 2), () {
                        loginViewModel.removeUser();
                        loginViewModel.saveLogIn(false);
                        loginViewModel.isLoading.value = false;
                        Get.offAll(() => const LoginScreen());
                      });
                    },
                    child: loginViewModel.isLoading.value
                        ? const CircularProgressIndicator()
                        : Text(
                            'Yes',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(
                                    fontSize: 16.sp, color: Colors.white),
                          )),
              ),
              setWidth(10),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black)),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'No',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontSize: 16.sp, color: Colors.white),
                  )),
            ],
          ),
        ),
      ],
      radius: 20);
}
