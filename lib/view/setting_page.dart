import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trasn_human_resource_managment/view/leave_page.dart';
import 'package:trasn_human_resource_managment/view/planned_holiday_page.dart';
import 'package:trasn_human_resource_managment/view/voucher_page.dart';
import '../model/user_profile_model.dart';
import '../viewModel/login_view_model.dart';
import '../viewModel/user_profile_view_model.dart';
import '../widget/helper.dart';
import 'change_password_page.dart';
import 'login_page.dart';
import 'user_profile_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<UserProfileModel> userSettingProfile;
  UserProfileViewModel userProfileViewModel = Get.put(UserProfileViewModel());
  @override
  void initState() {
    var userName = userProfileViewModel.retrieveUserName();
    userSettingProfile = userProfileViewModel.getUserProfileData(userName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
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
        FutureBuilder(
            future: userSettingProfile,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.none) {
                return const Center(
                  child: Text(
                    "Can not connect to server",
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.active ||
                  snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  var userData = snapshot.data;
                  return ProfileItem(
                    onTap: () {
                      Get.to(() => const UserProfilePage());
                    },
                    tittle: 'Name: ${userData?.empname}',
                    subTittle: 'Email Id: ${userData?.oemail}',
                    childWidget: CircleAvatar(
                      radius: 40.r,
                      child: const Image(
                        image: AssetImage('asset/successEmoji.png'),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(snapshot.error.toString()),
                        const Icon(Icons.error_outline),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                      child: Text(
                    "Something went wrong",
                  ));
                }
              } else {
                return const Center(
                    child: Text(
                  "Something went wrong",
                ));
              }
            }),
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
          onTap: () {
            Get.to(() => const LeaveScreen());
          },
          tittle: 'Leave',
          subTittle: 'Apply & manage your leave here',
          childWidget: CircleAvatar(
              radius: 35.r,
              child: const Image(
                height: 35,
                image: AssetImage('asset/calendar.png'),
              )),
        ),
        ProfileItem(
          onTap: () {
            Get.to(() => const Voucher());
          },
          tittle: 'Expense',
          subTittle: 'Apply & manage voucher form here',
          childWidget: CircleAvatar(
              radius: 35.r,
              child: Image(
                height: 40,
                color: isDark ? Colors.white : null,
                image: const AssetImage('asset/ewallet.png'),
              )),
        ),
        ProfileItem(
          onTap: () {
            Get.to(() => const PlannedHolidayScreen());
          },
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