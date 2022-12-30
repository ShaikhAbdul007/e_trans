import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

Widget setHeight(double size) {
  return SizedBox(
    height: size.h,
  );
}

Widget setWidth(double size) {
  return SizedBox(
    width: size.w,
  );
}

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Widget child;
  const CustomBottomSheet(
      {Key? key, required this.title, required this.onTap, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isdark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.h),
          child: Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const Spacer(),
              InkWell(
                onTap: onTap,
                child: Icon(
                  Icons.cancel,
                  color: isdark ? Colors.white : Colors.black,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.h),
          child: const Divider(
            color: Colors.black,
            thickness: 1,
            height: 0.5,
          ),
        ),
        child
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final int maxLines;
  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.suffixIcon,
      this.obscureText = false,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isdark = Theme.of(context).brightness == Brightness.dark;
    return TextField(
        style: GoogleFonts.poppins(color: Colors.black),
        obscureText: obscureText,
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.only(top: 10.h, left: 10.w),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 14.sp,
          ),
          border: InputBorder.none,
        ));
  }
}

class CustomButton extends StatelessWidget {
  final BuildContext context;
  final VoidCallback? onTap;
  final String buttonText;
  final IconData? iconData;
  final bool isLoading;
  const CustomButton(
      {Key? key,
      required this.context,
      required this.onTap,
      this.isLoading = false,
      required this.buttonText,
      this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isdark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: 40.h,
      width: 250.w,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        child: iconData != null
            ? isLoading
                ? const CircularProgressIndicator()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        buttonText,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: isdark ? Colors.black : null),
                      ),
                      Icon(
                        iconData,
                        color: isdark ? Colors.black : Colors.white,
                      )
                    ],
                  )
            : isLoading
                ? const CircularProgressIndicator()
                : Text(
                    buttonText,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: isdark ? Colors.black : null),
                  ),
      ),
    );
  }
}

class CustomDatePicker extends StatelessWidget {
  final String hintText;
  final DateTime selectedDate;
  final TextEditingController controller;
  const CustomDatePicker(
      {super.key,
      required this.hintText,
      required this.selectedDate,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    var isdark = Theme.of(context).brightness == Brightness.dark;
    return TextField(
      style: GoogleFonts.poppins(color: Colors.black),
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 10.h, left: 10.w),
        border: InputBorder.none,
        suffixIcon: InkWell(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(2030));
              if (pickedDate != null) {
                String formatDate = DateFormat('yyyy-mm-dd').format(pickedDate);
                controller.text = formatDate;
              } else {
                return;
              }
            },
            child: Icon(
              Icons.calendar_month_rounded,
              color: isdark ? Colors.black : null,
            )),
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}

class MyAnimation {
  static Widget animation(String animationText, BuildContext context) {
    return TweenAnimationBuilder(
        tween: IntTween(begin: 0, end: animationText.length),
        duration: const Duration(seconds: 2),
        builder: ((context, int value, child) {
          return Text(
            animationText.substring(0, value),
            style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Colors.black45,
                fontWeight: FontWeight.bold,
                fontSize: 25.sp),
          );
        }));
  }
}
