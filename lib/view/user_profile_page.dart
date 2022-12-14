import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trasn_human_resource_managment/widget/helper.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.r),
          bottomRight: Radius.circular(15.r),
        )),
        centerTitle: true,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 5.w, right: 10.w, bottom: 10.h),
        child: ListView(
          children: [
            setHeight(10),
            Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 55.r,
                    child: const Image(
                        image: AssetImage('asset/successEmoji.png')),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.only(top: 60.h, left: 90),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20.r,
                      child: const Icon(Icons.camera_alt_outlined),
                    ),
                  ),
                ),
              ],
            ),
            const ProfileItem(
                title: 'Abdul Rehman Shaikh', labelTitle: 'Empolyee Name :'),
            Row(
              children: const [
                Expanded(
                  child: ProfileItem(
                    labelTitle: 'Empolyee Id :',
                    title: 'TSV 313',
                  ),
                ),
                Expanded(
                  child: ProfileItem(
                    labelTitle: 'Department :',
                    title: 'IT',
                  ),
                ),
              ],
            ),
            const ProfileItem(
              labelTitle: 'Designation :',
              title: 'Software Developer',
            ),
            const ProfileItem(
              labelTitle: 'Add 1 :',
              title: '101/104/110, Skylark Building plot no 63',
            ),
            const ProfileItem(
              labelTitle: 'Add 2 :',
              title: 'Plot no 63, Sec. 11,CBD Belapur',
            ),
            Row(
              children: const [
                Expanded(
                  child: ProfileItem(
                    labelTitle: 'City :',
                    title: 'Navi Mumbai',
                  ),
                ),
                Expanded(
                  child: ProfileItem(
                    labelTitle: 'Pin Code :',
                    title: '400614',
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Expanded(
                  child: ProfileItem(
                    labelTitle: 'State :',
                    title: 'Maharastra',
                  ),
                ),
                Expanded(
                  child: ProfileItem(
                    labelTitle: 'Country :',
                    title: 'India',
                  ),
                ),
              ],
            ),
            const ProfileItem(
              labelTitle: 'Personal e-mail:',
              title: 'shaikhabdul2126@gmail.com',
            ),
            const ProfileItem(
              labelTitle: 'official e-mail:',
              title: 'abdultransvision@outlook.com',
            ),
            const ProfileItem(
              labelTitle: 'Mobile No:',
              title: '9768858160',
            ),
            const ProfileItem(
              labelTitle: 'Aadhaar Card:',
              title: '32XXXXXXX45XX',
            ),
            const ProfileItem(
              labelTitle: 'Pan Card :',
              title: '32XXXXXXX45XX',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String title;
  final String labelTitle;
  const ProfileItem({super.key, required this.title, required this.labelTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10.h, left: 10.w),
        padding: EdgeInsets.only(top: 10.h, left: 5.w),
        height: 40.h,
        width: 200.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: const [
              BoxShadow(blurRadius: 5, color: Colors.grey, offset: Offset(1, 1))
            ],
            color: Colors.white),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              labelTitle,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(fontSize: 12.sp, color: Colors.black),
            ),
            setWidth(2),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ));
  }
}
