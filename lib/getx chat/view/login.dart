
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realtimechat/designhelper.dart';
import 'package:realtimechat/getx%20chat/contollers/logincontroller.dart';

class loginview extends GetWidget<logincontroller> {
  // const login({Key key}) : super(key: key);
var c = Get.lazyPut(() => logincontroller()) ;
@override
  Widget build(BuildContext context) {
  TextEditingController emailcontoller = TextEditingController() ;
  TextEditingController passwordcontoller = TextEditingController() ;
  designhelper.init(context) ;
return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.login),
        title: Text("login"),
        centerTitle: true,
      ),
      body: Container(padding: EdgeInsets.only(left: 10 , right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          Container(
            // clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(200) ,

            ),
            child: TextFormField(controller: emailcontoller,
              decoration: InputDecoration(
               labelText: "Enter Email" ,
                  border: OutlineInputBorder(borderRadius:BorderRadius.circular(50) )

              ),
            ),
          ),
          SizedBox(height: designhelper.screenheight!*.02,),
          TextFormField(controller: passwordcontoller,
            decoration: InputDecoration(
              labelText: "Enter Password" ,
                border: OutlineInputBorder(borderRadius:BorderRadius.circular(50) )


            ),
          ) ,
            SizedBox(height: designhelper.screenheight!*.02,),

            ElevatedButton(
                onPressed: (){
              controller.loginmethod(emailcontoller.text, passwordcontoller.text) ;
            }, child: Text("login")) ,

            Obx(() => (controller.logindone.value==true)?CircularProgressIndicator():Text("") )
        ],),
      ),
    ) ; 
  }
}
