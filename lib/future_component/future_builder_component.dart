import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/helper.dart';

class CustomFutureComponent extends StatelessWidget {
  final Future future;
  final List list;
  final Widget listWidget;
  const CustomFutureComponent(
      {Key? key,
      required this.future,
      required this.list,
      required this.listWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style =
        Theme.of(context).textTheme.headline4?.copyWith(fontSize: 20.sp);
    final errorStyle = Theme.of(context)
        .textTheme
        .headline6
        ?.copyWith(fontSize: 20.sp, color: Colors.red);

    return FutureBuilder(
        future: future,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.none) {
            return Center(
                child: Text(
              "Can't Connect to Server...",
              style: style,
            ));
          } else if (snapshot.connectionState == ConnectionState.done ||
              snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red),
                    setHeight(10),
                    Text(snapshot.error.toString(), style: errorStyle)
                  ],
                ),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 5.h),
                        child: listWidget);
                  });
            } else {
              return Center(
                  child: Text(
                "SomeThing Went Wrong, Please try Again",
                style: style,
              ));
            }
          } else {
            return Center(
                child: Text(
              "SomeThing Went Wrong,Please try Again",
              style: style,
            ));
          }
        }));
  }
}
