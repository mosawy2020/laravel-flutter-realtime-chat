import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realtimechat/getx%20chat/view/login.dart';
import 'package:realtimechat/getx%20chat/view/messageview.dart';
import 'package:realtimechat/getx%20chat/view/onlineview.dart';
// import 'package:realtimechat/view/login.dart';
// import 'package:realtimechat/view/loginview.dart';

import 'getx chat/view/splashview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(



        primarySwatch : Colors.deepPurple

      ),
      home:  loginview(),
    );
  }
}
