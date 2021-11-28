import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:realtimechat/getx%20chat/view/onlineview.dart';


class logincontroller extends GetxController{
  RxBool logindone  = false.obs ;
  loginmethod (String email ,String  password) async {


    logindone.value = true ;

    var url = Uri.parse('http://10.0.2.2:8000/api/login');

    var response = await http.post(url, body: {'email': email, 'password': password},headers: {
    'Accept': 'application/json' ,
    'Charset': 'utf-8'});
if (response.statusCode == 200 ) {
String token = jsonDecode(response.body)['access_token'];
String id  = jsonDecode(json.encode(jsonDecode(response.body)["user"]).toString())['id'].toString() ;
// print(jsonDecode(json.encode(jsonDecode(response.body)["user"]).toString())['id']) ;
  final storage = new FlutterSecureStorage();
  storage.write(key: "token", value: token) ;
  storage.write(key: "id", value: id) ;
  Get.offAll(onlineview()) ;
}
else print(response.reasonPhrase.toString()) ;
logindone.value = false ;
  }




}