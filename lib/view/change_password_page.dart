import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/helper.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passController = TextEditingController();
    TextEditingController confirmController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.r),
            bottomRight: Radius.circular(15.r),
          )),
          centerTitle: true,
          title: Text(
            'Change Password',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 50.h),
          child: ListView(children: [
            setHeight(10),
            Text(
                'Security is must. \n\nPlease enter the address associated with your account'),
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
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: CustomTextField(
                  suffixIcon: const Icon(Icons.perm_identity_outlined),
                  hintText: "Password",
                  controller: passController,
                )),
            setHeight(20),
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
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: CustomTextField(
                  suffixIcon: const Icon(Icons.lock_outline),
                  hintText: " Confirm Password",
                  controller: confirmController,
                )),
            setHeight(50),
            CustomButton(context: context, onTap: () {}, buttonText: 'Submit')
          ]),
        ));
  }
}
