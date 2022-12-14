import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../viewModel/login_view_model.dart';
import '../widget/helper.dart';
import 'change_password_page.dart';
import 'login_page.dart';
import 'user_profile_page.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginViewModel loginViewModel = Get.put(LoginViewModel());
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.r),
          bottomRight: Radius.circular(15.r),
        )),
        centerTitle: true,
        title: Text(
          'Setting',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: ListView(shrinkWrap: true, children: [
        ProfileItem(
          onTap: () {
            Get.to(() => const UserProfilePage());
          },
          tittle: 'Name: Abdul Rehman Shaikh',
          subTittle: 'Email Id: abdul@gmail.com',
          childWidget: CircleAvatar(
            radius: 40.r,
            child: const Image(
              image: AssetImage('asset/successEmoji.png'),
            ),
          ),
        ),
        ProfileItem(
          onTap: () {
            Get.to(() => const ChangePasswordScreen());
          },
          tittle: 'Change Password',
          subTittle: 'Manage your password here',
          childWidget: CircleAvatar(
              radius: 35.r,
              child: Icon(
                Icons.security_outlined,
                size: 30.sp,
              )),
        ),
        ProfileItem(
          onTap: () {},
          tittle: 'Leave',
          subTittle: 'Manage your leave here',
          childWidget: CircleAvatar(
              radius: 35.r,
              child: const Image(
                height: 35,
                image: AssetImage('asset/calendar.png'),
              )),
        ),
        ProfileItem(
          onTap: () {},
          tittle: 'Expense',
          subTittle: 'Manage your expense here',
          childWidget: CircleAvatar(
              radius: 35.r,
              child: const Image(
                height: 40,
                image: AssetImage('asset/ewallet.png'),
              )),
        ),
        ProfileItem(
          onTap: () {},
          tittle: 'Planed Holiday',
          subTittle: 'Manage your planed holiday',
          childWidget: CircleAvatar(
              radius: 35.r,
              child: const Image(
                image: AssetImage('asset/leave.png'),
              )),
        ),
        ProfileItem(
          onTap: () => getDialog(context, loginViewModel),
          tittle: 'Log-Out',
          subTittle: 'Click to logout',
          childWidget: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 35.r,
              child: Icon(
                Icons.logout,
                size: 30.sp,
              )),
        ),
      ]),
    );
  }

  getDialog(BuildContext context, LoginViewModel loginViewModel) =>
      Get.defaultDialog(
          barrierDismissible: true,
          backgroundColor: Colors.grey.shade100,
          title: 'Alert',
          middleText: 'Are you want to logout ?',
          titleStyle: Theme.of(context).textTheme.headline4?.copyWith(
              fontSize: 15.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold),
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

class ProfileItem extends StatelessWidget {
  final String tittle;
  final String subTittle;
  final Widget childWidget;
  final VoidCallback onTap;
  const ProfileItem(
      {super.key,
      required this.tittle,
      required this.subTittle,
      required this.childWidget,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10.h, left: 5.w, right: 5.w),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
        height: 90.h,
        width: 345.w,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: CircleAvatar(radius: 35.r, child: childWidget),
            ),
            setWidth(10),
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tittle,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  setHeight(6),
                  Text(subTittle, style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//  Container(
//           margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
//           decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
//           height: 90.h,
//           width: 345.w,
//           child: Row(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(left: 10.w),
//                 child: const CircleAvatar(
//                   radius: 40,
//                   child: Image(
//                     image: AssetImage('asset/successEmoji.png'),
//                   ),
//                 ),
//               ),
//               setWidth(10),
//               Padding(
//                 padding: EdgeInsets.only(top: 30.h),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Name: Abdul Rehman Shaikh',
//                       style: Theme.of(context).textTheme.bodyText2,
//                     ),
//                     setHeight(6),
//                     Text('Email Id: abdul@gmail.com',
//                         style: Theme.of(context).textTheme.bodyText1),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),