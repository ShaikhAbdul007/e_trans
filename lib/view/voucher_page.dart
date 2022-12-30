import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../viewModel/voucher_view_model.dart';
import '../widget/helper.dart';

class Voucher extends StatelessWidget {
  const Voucher({super.key});

  @override
  Widget build(BuildContext context) {
    VoucherViewModel voucherViewModel = Get.put(VoucherViewModel());
    TextEditingController confirmController = TextEditingController();
    TextEditingController dateController = TextEditingController();
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
          'Voucher',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 8.w, top: 10.h, right: 8.w),
        child: ListView(children: [
          VoucherFields(
              label: 'Name',
              controller: confirmController,
              hintText: 'Enter Name'),
          setHeight(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  'Narration',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: isDark ? Colors.white : Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              setHeight(5),
              Container(
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
                  maxLines: 5,
                  hintText: 'Enter Narration',
                  controller: confirmController,
                ),
              )
            ],
          ),
          setHeight(15),
          Row(
            children: [
              Expanded(
                child: VoucherFields(
                    label: 'Voucher No',
                    controller: confirmController,
                    hintText: 'Enter Voucher no'),
              ),
              setWidth(2),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: isDark ? Colors.white : Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  setHeight(5),
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
                      controller: dateController,
                      hintText: 'Enter Date',
                      selectedDate: voucherViewModel.selectedDate.value,
                    ),
                  ),
                ],
              )),
            ],
          ),
          setHeight(15),
          VoucherFields(
              label: 'Bank & Branch',
              controller: confirmController,
              hintText: 'Enter Bank & Branch'),
          setHeight(15),
          Row(
            children: [
              Expanded(
                child: VoucherFields(
                    label: 'Paid Cash/Cheque',
                    controller: confirmController,
                    hintText: 'Enter Bank & Branch'),
              ),
              setWidth(2),
              Expanded(
                child: VoucherFields(
                    label: 'Cheque No',
                    controller: confirmController,
                    hintText: 'Enter Bank & Branch'),
              )
            ],
          ),
          setHeight(15),
          Row(
            children: [
              Expanded(
                child: VoucherFields(
                  label: 'Amount in Rs',
                  controller: confirmController,
                  hintText: 'Enter Amount',
                ),
              ),
              setWidth(2),
              Expanded(
                child: VoucherFields(
                  label: 'Total Amount',
                  controller: confirmController,
                  hintText: 'Enter Amount',
                ),
              ),
            ],
          ),
          setHeight(15),
          VoucherFields(
            label: 'Amount in Word',
            controller: confirmController,
            hintText: 'Enter Amount in word',
          ),
          setHeight(30),
          Padding(
            padding: EdgeInsets.only(left: 60.w, right: 60.w),
            child: CustomButton(
                context: context, onTap: () {}, buttonText: 'Submit'),
          )
        ]),
      ),
    );
  }
}

class VoucherFields extends StatelessWidget {
  final String label, hintText;
  final TextEditingController controller;
  const VoucherFields(
      {super.key,
      required this.label,
      required this.controller,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Text(
            label,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                color: isDark ? Colors.white : Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        setHeight(5),
        Container(
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
            hintText: hintText,
            controller: controller,
          ),
        )
      ],
    );
  }
}
