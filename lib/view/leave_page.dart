import 'package:flutter/material.dart';

class LeaveScreen extends StatelessWidget {
  const LeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Leave',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      drawer: Drawer(),
    );
  }
}
