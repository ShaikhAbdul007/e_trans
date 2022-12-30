import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trasn_human_resource_managment/view/attendance_page.dart';
import 'package:trasn_human_resource_managment/view/setting_page.dart';
import '../color/appcolor.dart';
import '../viewModel/bottom_navigation_view_model.dart';
import 'dashboard_page.dart';

class CustomButtomNavigation extends StatelessWidget {
  const CustomButtomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavigationViewModel bottomNavigationViewModel =
        BottomNavigationViewModel();
    int iconIndex = bottomNavigationViewModel.currentIndex.value;
    var isdark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        body: Obx(
          () => IndexedStack(
            index: bottomNavigationViewModel.currentIndex.value,
            children: const [
              DashBoardPage(),
              AttendanceScreen(),
              ProfileScreen()
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => Container(
            margin:
                EdgeInsets.only(top: 2.h, left: 10.w, right: 10.w, bottom: 5.h),
            height: 80,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      color: isdark ? Colors.black : Colors.grey.shade300,
                      offset: const Offset(5, -1),
                      spreadRadius: 2)
                ],
                borderRadius: BorderRadius.circular(25.r)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.r),
              child: BottomNavigationBar(
                  currentIndex: bottomNavigationViewModel.currentIndex.value,
                  onTap: (index) =>
                      bottomNavigationViewModel.changeIndex(index),
                  elevation: 10,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.dashboard_outlined,
                          color:
                              isdark ? Colors.white70 : navBarUnSelectedColor,
                        ),
                        activeIcon: Icon(
                          size: iconIndex == 0 ? 30.sp : 20.sp,
                          Icons.dashboard_outlined,
                          color: isdark ? Colors.white : navBarSelectedColor,
                        ),
                        label: 'DashBoard'),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.calendar_month_outlined,
                        color: isdark ? Colors.white70 : navBarUnSelectedColor,
                      ),
                      activeIcon: Icon(
                        size: iconIndex == 0 ? 30.sp : 20.sp,
                        Icons.calendar_month_sharp,
                        color: isdark ? Colors.white70 : navBarSelectedColor,
                      ),
                      label: 'Calender',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.settings,
                          color:
                              isdark ? Colors.white70 : navBarUnSelectedColor,
                        ),
                        activeIcon: Icon(
                          size: iconIndex == 0 ? 30.sp : 20.sp,
                          Icons.settings,
                          color: isdark ? Colors.white70 : navBarSelectedColor,
                        ),
                        label: 'Setting')
                  ]),
            ),
          ),
        ));
  }
}
