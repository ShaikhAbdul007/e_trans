import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trasn_human_resource_managment/widget/helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: ListView(shrinkWrap: true, children: [
        Container(
          margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
          height: 90.h,
          width: 345.w,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: const CircleAvatar(
                  radius: 40,
                  child: Image(
                    image: AssetImage('asset/successEmoji.png'),
                  ),
                ),
              ),
              setWidth(10),
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: Abdul Rehman Shaikh',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    setHeight(6),
                    Text('Email Id: abdul@gmail.com',
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
          height: 90.h,
          width: 345.w,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: CircleAvatar(
                    radius: 35.r,
                    child: Icon(
                      Icons.security_outlined,
                      size: 30.sp,
                    )),
              ),
              setWidth(10),
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Change Password',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    setHeight(6),
                    Text('Manage your password here',
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
          height: 90.h,
          width: 345.w,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 35.r,
                    child: Icon(
                      Icons.logout,
                      size: 30.sp,
                    )),
              ),
              setWidth(10),
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Log-Out',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: Colors.red),
                    ),
                    setHeight(6),
                    Text('Click to logout',
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
