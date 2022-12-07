import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceViewModel extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<DateTime> focusDate = DateTime.now().obs;
  Rx<CalendarFormat> calenderFormat = CalendarFormat.month.obs;
}
