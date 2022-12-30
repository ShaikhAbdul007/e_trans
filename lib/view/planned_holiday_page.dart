import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trasn_human_resource_managment/widget/helper.dart';
import '../viewModel/planned_holiday_view_model.dart';

class PlannedHolidayScreen extends StatelessWidget {
  const PlannedHolidayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PlannedHolidayViewModel holidayViewModel =
        Get.put(PlannedHolidayViewModel());
    TextEditingController fromDateController = TextEditingController();
    TextEditingController toDateController = TextEditingController();
    TextEditingController holidayReasonController = TextEditingController();
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.r),
          bottomRight: Radius.circular(15.r),
        )),
        centerTitle: true,
        title: Text(
          'Planned Holiday',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 40.h),
        child: ListView(
          children: [
            setHeight(10),
            Text(
              'Leave Date',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: isDark ? Colors.white : Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
            ),
            setHeight(10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: CustomDatePicker(
                  hintText: 'Choose Date',
                  selectedDate: holidayViewModel.selectedFromDate.value,
                  controller: fromDateController),
            ),
            setHeight(10),
            Text(
              'Return Date',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: isDark ? Colors.white : Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
            ),
            setHeight(10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: CustomDatePicker(
                  hintText: 'Choose Date',
                  selectedDate: holidayViewModel.selectedToDate.value,
                  controller: toDateController),
            ),
            setHeight(10),
            Text(
              'Comments',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: isDark ? Colors.white : Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
            ),
            setHeight(10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: CustomTextField(
                maxLines: 6,
                controller: holidayReasonController,
                hintText: 'Enter Comments',
              ),
            ),
            setHeight(20),
            Padding(
              padding: EdgeInsets.only(left: 60.w, right: 60.w),
              child: CustomButton(
                  context: context, onTap: () {}, buttonText: 'Submit'),
            )
          ],
        ),
      ),
    );
  }
}
