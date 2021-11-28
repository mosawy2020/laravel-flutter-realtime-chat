// import 'dart:convert';
//
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:realtimechat/view/login.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// class authcontoller extends GetxController{
// RxInt  i = 0.obs ;
//     bool logindonne = false  ;
//      String?  email
//             , password;
//      Oninit (){
//
//      }
//  Future loginmethod(String memail , String mpassword) async {
//
//     var url = Uri.parse('http://10.0.2.2:8000/api/login');
//     // var headers = ({
//     //   'email': 'sawyhawy@gmail.com',
//     //   'password': '123456789'
//     // });
//
//     var response = await http.post(url, body: {'email': memail, 'password': mpassword} );
//
//     // response.headers.addAll(headers);
// if (response.statusCode ==200) {
//   logindonne = true  ;
//   // i++ ;
//   final storage = new FlutterSecureStorage();
//   String token = jsonDecode(response.body)["access_token"];
//   await storage.write(key: "token", value: token);
// print(token) ;
//   Get.to(chatview()) ;
//
//
//   print(response.body.toString()+logindonne.toString()) ;
// }
// else print(response.body) ;
//
//   }
//
//
//
// }