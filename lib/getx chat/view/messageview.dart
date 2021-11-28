import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realtimechat/designhelper.dart';
import 'package:realtimechat/getx%20chat/contollers/chatcontroller.dart';
import 'package:realtimechat/getx%20chat/contollers/realtimecontoller.dart';

class messageview extends GetWidget<realtimecontroller> {
  // const messageview({Key key}) : super(key: key);

  var c = Get.lazyPut(() => chatcontroller()) ;
  var c2 = Get.lazyPut(() => realtimecontroller()) ;
var msgcontoller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    dynamic argumentData = Get.arguments;
// print(argumentData) ;
    return Scaffold(

      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title:Text( argumentData[1]),
        actions: [Icon(Icons.call) , Icon(Icons.video_call)],
        elevation: 0,


      ),
      body: Container (
        color: Colors.deepPurple,
        child: Container(color: Colors.deepPurple,
        child: Column(

          children: [
            // SizedBox(height: 50,) ,
            Expanded(child: Container(decoration: BoxDecoration(color: Colors.white ,
              borderRadius: BorderRadius.only(topRight: Radius.circular(20) , topLeft: Radius.circular(50))

            ),
              child:        Obx(() {

                controller.readmessages("msg");
                return  ListView.separated(
           itemBuilder: (context , index) { return
      Padding(
    padding: const EdgeInsets.all(20),
    child: (controller.lastmsg.value[index].keys.first=="r")?Container(
    width:double.infinity,
    height: designhelper.screenheight!*.09,
    child: Text(
   " "+ controller.lastmsg.value[index].entries.first.value.toString().toString(),style: TextStyle(fontSize: 20, color: Colors.white),),
      decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20) , bottomLeft: Radius.circular(20)),color: Colors.redAccent.shade200),
    ):Container(
      // color: Colors.pink
      width:double.infinity,
      height: designhelper.screenheight!*.09,
      child: Text(
          " "+controller.lastmsg.value[index].entries.last.value.toString(), style: TextStyle(fontSize: 20 , color: Colors.white),),
             decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20) , bottomLeft: Radius.circular(20)),color: Colors.pink.shade200),
             ),
    )
    ;
    }  ,

    separatorBuilder: (context , index)=> SizedBox(height: 1,),
    // ignore: invalid_use_of_protected_member
    itemCount: controller.i.value
                );
              }
    ) ,
    )
    ),

            Container(height: 50,color: Colors.white,
              child: TextFormField(controller: msgcontoller,
                decoration: InputDecoration(suffix: GestureDetector(onTap:(){
                  // print(msgcontoller.text+ argumentData[0].toString()) ;
                  controller.sendmessage(msgcontoller.text, argumentData[0].toString());
                },child: IconButton(icon: Icon(Icons.send), onPressed:(){
    // print(msgcontoller.text+ argumentData[0].toString()) ;
              controller.sendmessage(msgcontoller.text, argumentData[0].toString());
                   } )),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)) ,
                  hintText: "type here ",
                  //
                ),
              ),
            )
          ],
        )
          ,),
      )
      ,
    );
  }
}
