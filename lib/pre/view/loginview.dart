// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:realtimechat/controller/authcontroller.dart';
// import 'package:realtimechat/controller/realtime/onlinecontroller.dart';
//
// import 'login.dart';
//
// class loginview extends GetWidget<getonline> {
//   authcontoller  c = Get.put(authcontoller());
//   // getonline  c2 = Get.put(getonline());
//
//   // const loginview({Key key}) : super(key: key);
//   TextEditingController emailController =  TextEditingController();
//   TextEditingController passController =  TextEditingController();
//
//   // authcontoller contorller = authcontoller();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("login"),
//         )
//         , body: Obx(  (){ return Container(padding: EdgeInsets.all(20),
//       child: Column( mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//       Column(crossAxisAlignment: CrossAxisAlignment.start ,
//       children: [    (Text("email")) ,
//       TextFormField(controller: emailController,
//
//       decoration:InputDecoration(
//       hintText: "email"
//       ),
//       ),
//       ],
//       ) ,
//       Column(crossAxisAlignment: CrossAxisAlignment.start,
//       children: [Text("password") ,
//       TextFormField(controller:passController,
//       // onSubmitted: (){},
//       decoration:InputDecoration(
//       hintText: "password"
//       ),
//       ),
//       ],
//       ) ,
//       ElevatedButton(onPressed: (){
//        // var x =  c2.initPusherClient();
//
//         c.email = emailController.text ;
//         c.password = passController.text  ;
//          c.loginmethod(c.email!, c.password!) ;
//       },
//
//       child: Text(
//
//         (c.logindonne.obs.value==true )?"done" :"still",
//         style: TextStyle(fontSize: 25),)
//       ) ,
//
//  //     FutureBuilder(future:c2.initPusherClient()  ,
//  //    builder:(context , AsyncSnapshot snapshot) {
//  //      // c2.initPusherClient() ;a
//  //      return  (c2.usersfetched.obs.value==false)?  CircularProgressIndicator()
//  //      :Text(snapshot.data[0]["name"].toString()) ;
//  //
//  // }
//  //
//  // )
//
//       ],
//
//       ),
//       ) ;}
//
//         ),
//       ),
//     ) ;
//   }
// }
