import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trasn_human_resource_managment/cache_manager/cache_manager.dart';
import 'package:trasn_human_resource_managment/view/bottom_navigation_view.dart';
import 'package:trasn_human_resource_managment/view/dashboard_page.dart';
import 'package:trasn_human_resource_managment/view/login_page.dart';

import '../widget/helper.dart';

class SplashPageScreen extends StatefulWidget {
  const SplashPageScreen({Key? key}) : super(key: key);

  @override
  State<SplashPageScreen> createState() => _SplashPageScreenState();
}

class _SplashPageScreenState extends State<SplashPageScreen> {
  CacheManager manager = CacheManager();
  final userDate = GetStorage();

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () async {
      manager.checkUserLogged().then((status) {
        if (status == true) {
          Get.offAll(() => const CustomButtomNavigation());
        }
        if (status == false) {
          Get.offAll(() => const LoginScreen());
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0xFFCC9900),
                Color(0xffff9900),
                Color(0xFFCC9900),
              ])),
          child: Column(
            children: [
              const Image(
                  fit: BoxFit.cover,
                  image: AssetImage('asset/splashscreenn.png')),
              Expanded(child: MyAnimation.animation('E-Trans', context))
            ],
          )),
    );
  }
}
