import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trasn_human_resource_managment/widget/helper.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
              Color(0xFFCC9900),
              Color(0xffff9900),
              Color(0xFFCC9900),
            ])),
        child: ListView(shrinkWrap: true, children: [
          Padding(
            padding: EdgeInsets.only(top: 30.h, left: 5.w),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  child: Image(
                    image: AssetImage('asset/successEmoji.png'),
                  ),
                ),
                setWidth(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: Abdul Rehman Shaikh',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      setHeight(6),
                      Text('Email Id: abdul@gmail.com',
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h),
            child: const Divider(
              height: 1.5,
              color: Colors.white,
              thickness: 1,
            ),
          ),
          DrawerItem(
            color: Colors.white,
            iconColor: Colors.white,
            iconSize: 16.sp,
            onTap: () {},
            text: 'PaySlip',
            widget: Icon(Icons.single_bed_sharp),
          ),
          DrawerItem(
            color: Colors.white,
            iconColor: Colors.white,
            iconSize: 16.sp,
            onTap: () {},
            text: 'PaySlip',
            widget: Icon(Icons.single_bed_sharp),
          ),
          DrawerItem(
            color: Colors.white,
            iconColor: Colors.white,
            iconSize: 16.sp,
            onTap: () {},
            text: 'PaySlip',
            widget: Icon(Icons.single_bed_sharp),
          ),
          DrawerItem(
            color: Colors.white,
            iconColor: Colors.white,
            iconSize: 16.sp,
            onTap: () {},
            text: 'PaySlip',
            widget: Icon(Icons.single_bed_sharp),
          ),
          DrawerItem(
            color: Colors.white,
            iconColor: Colors.white,
            iconSize: 16.sp,
            onTap: () {},
            text: 'PaySlip',
            widget: Icon(Icons.single_bed_sharp),
          )
        ]),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String text;
  final Icon widget;
  final Color iconColor;
  final Color color;
  final double iconSize;
  final VoidCallback onTap;

  const DrawerItem(
      {Key? key,
      required this.text,
      required this.widget,
      required this.iconColor,
      required this.color,
      required this.onTap,
      required this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: SizedBox(height: 24, width: 24, child: widget),
        title: Text(text,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 16.sp, color: Colors.black)),
        onTap: onTap);
  }
}
