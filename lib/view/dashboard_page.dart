import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../viewModel/login_view_model.dart';
import '../widget/helper.dart';
import 'package:intl/intl.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import '../widget/notification.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  late final Future<String> security;

  LoginViewModel loginViewModel = Get.put(LoginViewModel());
  XFile? imageFile;
  bool textScanning = false;
  String scannedText = '';
  @override
  void initState() {
    var userName = loginViewModel.retrieveUserName();
    security = loginViewModel.getSecurityCode(userName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isdark = Theme.of(context).brightness == Brightness.dark;
    final style =
        Theme.of(context).textTheme.headline4?.copyWith(fontSize: 20.sp);
    final securityStyle = Theme.of(context).textTheme.headline4?.copyWith(
        fontSize: 20.sp,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        shadows: const [Shadow(color: Colors.black45, blurRadius: 8)]);
    final labelStyle = Theme.of(context).textTheme.headline4?.copyWith(
        fontSize: 15.sp, color: Colors.black, fontWeight: FontWeight.bold);
    final errorStyle = Theme.of(context)
        .textTheme
        .headline6
        ?.copyWith(fontSize: 16.sp, color: Colors.red);

    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.r),
          bottomRight: Radius.circular(15.r),
        )),
        title: Text(
          'DashBoard',
          style: Theme.of(context).textTheme.headline5,
        ),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.h, left: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.h, left: 10.w),
                  child: Text(
                    'Welcome',
                    style: style?.copyWith(
                        color:
                            isdark ? Colors.white : Colors.black.withOpacity(1),
                        fontSize: 18.sp),
                  ),
                ),
                setHeight(2),
                Padding(
                  padding: EdgeInsets.only(top: 5.h, left: 10.w),
                  child: Text(
                    'Abdul Shaikh',
                    style: style?.copyWith(
                      color: isdark ? Colors.white : Colors.blueGrey,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
                setHeight(10),
                Padding(
                  padding: EdgeInsets.only(top: 5.h, left: 10.w),
                  child: Text(
                    'Today Status',
                    style: style?.copyWith(
                        color: isdark ? Colors.white : Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h, left: 20.w),
            child: RichText(
                text: TextSpan(
                    text: DateTime.now().day.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontSize: 20.sp, color: Colors.red),
                    children: [
                  TextSpan(
                      text: DateFormat(' MMMM yyyy')
                          .format(DateTime.now())
                          .toString(),
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontSize: 18.sp,
                          color: isdark ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold))
                ])),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.h, left: 20.w),
            child: StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                return Text(
                  DateFormat('hh:mm:ss a').format(DateTime.now()),
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontSize: 22.sp,
                      color: isdark ? Colors.white : Colors.black38),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
            height: 100.h,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  color: Colors.black54, blurRadius: 10, offset: Offset(2, 2))
            ], borderRadius: BorderRadius.circular(30.r), color: Colors.white),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Check In',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.black)),
                    setHeight(5),
                    Text(
                      '9:30 Am',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(fontSize: 22.sp, color: Colors.black),
                    )
                  ],
                )),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: const VerticalDivider(
                    thickness: 1.5,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Check Out',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.red)),
                    setHeight(5),
                    Text('6:30 Pm',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(fontSize: 22.sp, color: Colors.black))
                  ],
                )),
              ],
            ),
          ),
          setHeight(10),
          // // Container(
          // //   height: 300,
          // //   width: 500,
          // //   child: imageFile == null
          // //       ? const Center(child: Text("No Image Selected"))
          // //       : Image.file(File(imageFile!.path)),
          // // ),
          // // setHeight(10),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     InkWell(
          //       onTap: () {
          //         getImage(ImageSource.gallery);
          //       },
          //       child: const Text(
          //         "Scan From Gallery",
          //         style: TextStyle(fontSize: 20, color: Colors.blueAccent),
          //       ),
          //     ),
          //     setWidth(10),
          //     InkWell(
          //       onTap: () {
          //         getImage(ImageSource.camera);
          //       },
          //       child: const Text(
          //         "Scan From camera",
          //         style: TextStyle(fontSize: 20, color: Colors.red),
          //       ),
          //     ),
          //   ],
          // ),
          // setWidth(10),

          // Container(
          //     margin: const EdgeInsets.only(left: 50),
          //     height: 200,
          //     child: textScanning == false
          //         ? SingleChildScrollView(
          //             child: Text(
          //               scannedText,
          //             ),
          //           )
          //         : const Text('No text Detected'))
          // Container(
          //   margin: const EdgeInsets.only(left: 50.0, top: 15, right: 50),
          //   child: CustomButton(
          //       context: context,
          //       onTap: () {
          //         CustomNotification.showCustomNotification(
          //             body: "Your Leave Request has been Accepted",
          //             payLoad: 'payload',
          //             title: "Jafar");
          //       },
          //       buttonText: 'Notification'),
          // )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var username = loginViewModel.retrieveUserName();
          showModalBottomSheet(
              context: context,
              isDismissible: false,
              builder: (context) => CustomBottomSheet(
                  title: "Security Code",
                  onTap: () {
                    Get.back();
                  },
                  child: FutureBuilder(
                      future: loginViewModel.getSecurityCode(username),
                      builder: ((context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: Padding(
                            padding: EdgeInsets.only(top: 50.h, bottom: 50.h),
                            child: const CircularProgressIndicator(),
                          ));
                        } else if (snapshot.connectionState ==
                            ConnectionState.none) {
                          return Center(
                              child: Text(
                            "Can't Connect to Server...",
                            style: style,
                          ));
                        } else if (snapshot.connectionState ==
                                ConnectionState.done ||
                            snapshot.connectionState ==
                                ConnectionState.active) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.error_outline,
                                      color: Colors.red),
                                  setHeight(10),
                                  Text(snapshot.error.toString(),
                                      style: errorStyle)
                                ],
                              ),
                            );
                          } else if (snapshot.hasData) {
                            var data = snapshot.data;
                            return Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                children: [
                                  Container(
                                    height: 50.h,
                                    width: 300.w,
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              blurRadius: 5,
                                              offset: const Offset(0, 5))
                                        ]),
                                    child: Row(
                                      children: [
                                        if (data == 'No Data Found') ...{
                                          Text(data.toString(),
                                              style: securityStyle)
                                        } else ...{
                                          Text('Security Code',
                                              style: labelStyle),
                                          setWidth(10),
                                          Icon(
                                            Icons.arrow_right_alt,
                                            size: 25.sp,
                                            color: Colors.black,
                                          ),
                                          setWidth(10),
                                          Text(data.toString(),
                                              style: securityStyle)
                                        }
                                      ],
                                    ),
                                  ),
                                  setHeight(20),
                                  CustomButton(
                                      context: context,
                                      onTap: () {
                                        Get.back();
                                      },
                                      buttonText: "Ok"),
                                  setHeight(40),
                                ],
                              ),
                            );
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
                      }))));
        },
        child: const Image(
          image: AssetImage('asset/chatbot 1.png'),
        ),
      ),
    );
  }

  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage == null) {
        return;
      } else {
        textScanning = true;
        imageFile = pickedImage;
        setState(() {});
        getRecognisedText(pickedImage);
      }
    } catch (e) {
      textScanning = false;
      print(e.toString());
    }
  }

  void getRecognisedText(XFile image) async {
    textScanning = true;
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognizedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = "";
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = "$scannedText${line.text}\n";
      }
    }
    textScanning = false;
    setState(() {});
  }
}
