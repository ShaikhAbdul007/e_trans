import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trasn_human_resource_managment/widget/helper.dart';
import '../viewModel/attendance_view_model.dart';
import 'package:intl/intl.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isdark = Theme.of(context).brightness == Brightness.dark;
    AttendanceViewModel attendanceViewModel = Get.put(AttendanceViewModel());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.r),
          bottomRight: Radius.circular(15.r),
        )),
        title: Text(
          'Attendance',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Container(
        height: double.infinity,
        child: ListView(
          shrinkWrap: true,
          children: [
            Obx(
              () => TableCalendar(
                rowHeight: 60.h,
                headerStyle: HeaderStyle(
                    formatButtonVisible: true,
                    titleCentered: true,
                    titleTextStyle: TextStyle(
                      color: isdark ? Colors.white : null,
                      fontSize: 18.sp,
                    ),
                    headerPadding: EdgeInsets.only(top: 10.h)),
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
                holidayPredicate: (day) {
                  return isSameDay(attendanceViewModel.selectedDate.value, day);
                },
                daysOfWeekHeight: 50.h,
                weekendDays: const [DateTime.saturday, DateTime.sunday],
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekendStyle: TextStyle(color: Colors.red),
                ),
                calendarStyle: CalendarStyle(
                    defaultTextStyle:
                        TextStyle(color: isdark ? Colors.white : null),
                    weekendTextStyle: const TextStyle(color: Colors.red),
                    todayDecoration: BoxDecoration(
                        color: isdark ? Colors.black : Colors.orange,
                        shape: BoxShape.circle),
                    isTodayHighlighted: true,
                    selectedDecoration: BoxDecoration(
                        color: isdark ? Colors.white24 : Colors.lightBlue,
                        shape: BoxShape.circle)),
                onDaySelected: (selectedDay, focusedDay) {
                  attendanceViewModel.selectedDate.value = selectedDay;
                  attendanceViewModel.focusDate.value = focusedDay;
                },
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  List<Color> color = [
                    Colors.green,
                    Colors.yellow,
                    Colors.red.shade300,
                  ];
                  List<String> tittle = ['Full Day', 'Half Day', 'Absent'];
                  List<String> subTittle = [
                    '9 hr Completed',
                    '4.5 hr Completed ',
                    '0 hr  Completed'
                  ];
                  return Container(
                    margin: EdgeInsets.only(
                        top: 5.h, left: 10.w, right: 10.w, bottom: 5.h),
                    height: 40.h,
                    width: 800.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 10,
                              offset: const Offset(2, 2))
                        ]),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: color[index],
                          ),
                        ),
                        setWidth(10),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tittle[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      fontSize: 18.sp, color: Colors.grey),
                            ),
                            Text(subTittle[index])
                          ],
                        ))
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
      //drawer: const CustomDrawer(),
    );
  }
}
