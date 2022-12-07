import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trasn_human_resource_managment/view/attendance_page.dart';
import 'package:trasn_human_resource_managment/view/leave_page.dart';
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
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: bottomNavigationViewModel.currentIndex.value,
          children: const [
            DashBoardPage(),
            AttendanceScreen(),
            LeaveScreen(),
            ProfileScreen()
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: bottomNavigationViewModel.currentIndex.value,
          onTap: (index) => bottomNavigationViewModel.changeIndex(index),
          elevation: 10,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard_outlined,
                  color: navBarUnSelectedColor,
                ),
                activeIcon: Icon(
                  Icons.dashboard_outlined,
                  color: navBarSelectedColor,
                ),
                label: 'DashBoard'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_month_outlined,
                  color: navBarUnSelectedColor,
                ),
                activeIcon: Icon(
                  Icons.calendar_month_sharp,
                  color: navBarSelectedColor,
                ),
                label: 'Leave'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_today,
                  color: navBarUnSelectedColor,
                ),
                activeIcon: Icon(
                  Icons.calendar_today,
                  color: navBarSelectedColor,
                ),
                label: 'TimeSheet'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: navBarUnSelectedColor,
                ),
                activeIcon: Icon(
                  Icons.settings,
                  color: navBarSelectedColor,
                ),
                label: 'Setting'),
          ],
        ),
      ),
    );
  }
}
