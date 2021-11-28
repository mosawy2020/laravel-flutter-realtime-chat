import 'package:flutter/material.dart';
import 'dart:developer';
class designhelper  {
  // const ({Key key}) : super(key: key);
  static double? screenwidth ;
  static double? screenheight;
static void init ( BuildContext context) {

 screenwidth =  MediaQuery.of(context).size.width;
 screenheight =  MediaQuery.of(context).size.height;



}
}
