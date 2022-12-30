import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trasn_human_resource_managment/widget/helper.dart';
import '../model/user_profile_model.dart';
import '../viewModel/user_profile_view_model.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late Future<UserProfileModel> userProfile;
  UserProfileViewModel userProfileViewModel = Get.put(UserProfileViewModel());
  @override
  void initState() {
    var userName = userProfileViewModel.retrieveUserName();
    userProfile = userProfileViewModel.getUserProfileData(userName);
    super.initState();
  }

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
          child: FutureBuilder(
              future: userProfile,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.none) {
                  return const Center(
                    child: Text(
                      "Can not connect to server",
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.connectionState == ConnectionState.active ||
                    snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    var userData = snapshot.data;
                    return ListView(
                      children: [
                        setHeight(10),
                        Stack(
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 55.r,
                                child: const Image(
                                    image:
                                        AssetImage('asset/successEmoji.png')),
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
                        setHeight(5),
                        ProfileItem(
                            title: userData?.empname.toString() ?? '',
                            labelTitle: 'Empolyee Name :'),
                        setHeight(5),
                        Row(
                          children: [
                            Expanded(
                              child: ProfileItem(
                                labelTitle: 'Empolyee Id :',
                                title: userData?.empid.toString() ?? '0',
                              ),
                            ),
                            Expanded(
                              child: ProfileItem(
                                labelTitle: 'Mobile No:',
                                title: userData?.mobileno1.toString() ?? '0',
                              ),
                            ),
                          ],
                        ),
                        setHeight(5),
                        Row(
                          children: [
                            Expanded(
                              child: ProfileItem(
                                labelTitle: 'Designation :',
                                title: userData?.designation ?? 'No Data',
                              ),
                            ),
                            Expanded(
                              child: ProfileItem(
                                labelTitle: 'Department :',
                                title: userData?.department ?? 'No Data',
                              ),
                            ),
                          ],
                        ),
                        setHeight(5),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 10.w),
                          padding: EdgeInsets.only(left: 5.w, top: 5.h),
                          height: 35.h,
                          width: double.infinity,
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
                          child: Text(userData?.address ?? 'No Details'),
                        ),
                        setHeight(5),
                        Row(
                          children: [
                            const Expanded(
                              child: ProfileItem(
                                labelTitle: 'City :',
                                title: 'Navi Mumbai',
                              ),
                            ),
                            Expanded(
                              child: ProfileItem(
                                labelTitle: 'Pin Code :',
                                title:
                                    userData?.pincode.toString() ?? 'No Data',
                              ),
                            ),
                          ],
                        ),
                        setHeight(5),
                        Row(
                          children: [
                            Expanded(
                              child: ProfileItem(
                                labelTitle: 'State :',
                                title: userData?.state ?? 'No Data',
                              ),
                            ),
                            Expanded(
                              child: ProfileItem(
                                labelTitle: 'Country :',
                                title: userData?.country ?? 'No Data',
                              ),
                            ),
                          ],
                        ),
                        setHeight(5),
                        ProfileItem(
                          labelTitle: 'Personal e-mail:',
                          title: userData?.pemail ?? 'No Data',
                        ),
                        setHeight(5),
                        ProfileItem(
                          labelTitle: 'Official e-mail:',
                          title: userData?.oemail ?? 'No Data',
                        ),
                        setHeight(5),
                        Row(
                          children: [
                            Expanded(
                              child: ProfileItem(
                                labelTitle: 'Aadhaar Card:',
                                title: userData?.adhar ?? 'No Data',
                              ),
                            ),
                            Expanded(
                              child: ProfileItem(
                                labelTitle: 'Pan Card :',
                                title: userData?.pancard ?? 'No Data',
                              ),
                            )
                          ],
                        ),
                        setHeight(5),
                      ],
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
              })),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String title;
  final String labelTitle;
  const ProfileItem({super.key, required this.title, required this.labelTitle});

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Text(
            labelTitle,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                color: isDark ? Colors.white : Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        setHeight(5),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 10.w),
          padding: EdgeInsets.only(left: 5.w, top: 5.h),
          height: 35.h,
          width: double.infinity,
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
          child: Text(
            title,
          ),
        )
      ],
    );
  }
}
