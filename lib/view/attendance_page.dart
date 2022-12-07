import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../viewModel/attendance_view_model.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AttendanceViewModel attendanceViewModel = Get.put(AttendanceViewModel());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Attendance',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Column(
        children: [
          Obx(
            () => TableCalendar(
              availableGestures: AvailableGestures.all,
              rowHeight: 60.h,
              headerStyle: HeaderStyle(
                  formatButtonVisible: true,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    fontSize: 20.sp,
                  ),
                  headerPadding: EdgeInsets.only(top: 20.h)),
              firstDay: DateTime.utc(2008, 01, 01),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: attendanceViewModel.selectedDate.value,
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarFormat: attendanceViewModel.calenderFormat.value,
              onFormatChanged: (format) {
                attendanceViewModel.calenderFormat.value = format;
              },
              selectedDayPredicate: (day) {
                return isSameDay(attendanceViewModel.selectedDate.value, day);
              },
              calendarStyle: const CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                      color: Colors.blueGrey, shape: BoxShape.circle)),
              onDaySelected: (selectedDay, focusedDay) {
                attendanceViewModel.selectedDate.value = selectedDay;
                attendanceViewModel.focusDate.value = focusedDay;
              },
            ),
          )
        ],
      ),
      drawer: Drawer(),
    );
  }
}
