import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realtimechat/designhelper.dart';
import 'package:realtimechat/getx%20chat/contollers/realtimecontoller.dart';
import 'package:realtimechat/getx%20chat/view/messageview.dart';

class onlineview extends GetWidget<realtimecontroller> {
  // const onlineview({Key key}) : super(key: key);
  var c = Get.lazyPut(() => realtimecontroller())  ;
  @override
  Widget build(BuildContext context) {
    designhelper.init(context) ;
    controller.getonlinemethod();
    return
      Scaffold(
      body: Container(
        color: Colors.deepPurple,
        child: SafeArea(
          child: Column(children: [
            Container(height: designhelper.screenheight!*.1,
                padding:EdgeInsets.only(top: 20),child: Text("chat with friends" ,style: TextStyle(color: Colors.white , fontSize: 30))) ,

            Expanded(
              child: Container(padding: EdgeInsets.all(10),decoration: BoxDecoration(color: Colors.white,

                borderRadius: BorderRadius.only(topRight: Radius.circular(50) , topLeft: Radius.circular(50) )
              ),
             child: Obx(()=>(

                 controller.usersfetched.value)?ListView.separated(
                 itemCount: controller.userscount.value ,
                 separatorBuilder: (BuildContext context, int index) => SizedBox(

                   height: designhelper.screenheight!*.02,),

                 itemBuilder:(context , index) {

                   var list =  [];
                   var list2 = [];
                   controller.usersmap.value[index].entries.forEach((e) => list.add((e.value)));
                   controller.usersmap.value[index].keys.forEach((e) => list2.add((e)));

                     // print (list2) ;
                     return  Obx(() => (controller.usersfetched.value) ?GestureDetector (onTap: (){
                     Get.to(messageview() , arguments: [list2[0],list[0] ]);

                   } , child: item(list[0]))  : SizedBox(height:50,child: CircularProgressIndicator()) ) ;
                 }

                   ):Row(mainAxisAlignment:MainAxisAlignment.center,children: [
               CircularProgressIndicator(),

             ],),
               
              )),
            )
          ],

          ),
        ),
      ),
    ) ;
  }
  Widget item (String name)=>   Row(
    // mainAxisAlignment: MainAxisAlignment.
    // ,

    children: [
      Container(width: designhelper.screenwidth!*.1,
        height: designhelper.screenheight!*.1,
        color: Colors.transparent,
        child: CircleAvatar(
          backgroundImage: NetworkImage("https://pbs.twimg.com/media/Ea3jz_1WoAANHhD.png" ),
          backgroundColor: Colors.transparent,
        ),
      ) ,
      SizedBox(width: designhelper.screenwidth!*.1,),
      Expanded(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,maxLines: 1,overflow: TextOverflow.ellipsis,),
            Text("last msg ",maxLines: 1,overflow: TextOverflow.ellipsis,)
          ],
        ),
      ) ,

    ],
  ) ;
}
