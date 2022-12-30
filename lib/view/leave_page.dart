import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../viewModel/leave_view_model.dart';
import '../widget/helper.dart';

class LeaveScreen extends StatelessWidget {
  const LeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    TextEditingController leaveDateController = TextEditingController();
    TextEditingController leaveReasonController = TextEditingController();
    LeaveViewModel leaveViewModel = Get.put(LeaveViewModel());
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.r),
          bottomRight: Radius.circular(15.r),
        )),
        centerTitle: true,
        title: Text(
          'Leave',
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
                  selectedDate: leaveViewModel.selectedDate.value,
                  controller: leaveDateController),
            ),
            setHeight(10),
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
                controller: leaveReasonController,
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
