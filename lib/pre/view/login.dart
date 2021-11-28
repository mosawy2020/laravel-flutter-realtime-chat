// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:realtimechat/controller/realtime/onlinecontroller.dart';
// import 'package:realtimechat/designhelper.dart';
// class chatview extends GetWidget <getonline>{
//   // const ({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     designhelper().init(context);
//     // getonline().initPusherClient() ;
//     getonline c2 = Get.put(getonline())  ;
//     // var res = c2.initPusherClient() ;
//
//     return Scaffold(
//    body: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: [
//          // SizedBox(height: designhelper.screenheight! *.1,),
//        Container(
//       padding: EdgeInsets.only(top:designhelper.screenheight! *.1),
//       decoration:  BoxDecoration(
//         // color: Colors.orange,
//         color: Colors.deepPurple,
//       ),
//       // height: designhelper.screenheight!*1,
//       width: designhelper.screenwidth,
//       child: Column(
//         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//              "  Chat with your friends"
//              ,style: TextStyle(
//                fontWeight: FontWeight.bold
//                ,fontSize: 30
//               ,color: Colors.white
//            ),),
//
//           Container(
//             // padding: EdgeInsets.only(top:designhelper.screenheight! *.1),
//
//             width: designhelper.screenwidth!,
//             height:designhelper.screenheight!*.1 ,
//             child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 50,
//                 itemBuilder: (context , int index) {
//                   return Container(
//                       // padding: EdgeInsets.all(8),
//                       width: designhelper.screenwidth!*.2,
//                       height: designhelper.screenheight!*.05,
//                       child: CircleAvatar ( radius: 20,backgroundColor: Colors.green,
//                     backgroundImage:
//                           NetworkImage("https://as2.ftcdn.net/v2/jpg/01/95/69/13/500_F_195691368_L2z247vOrgxZOqNQe2In1MpfY21Vo3Cz.jpg")
//                         ,
//                   )
//                   ) ;
//                 }
//
//             ),
//           ),
//            Container(
//              height: designhelper.screenheight!*.69,
//              decoration: BoxDecoration(
//                color: Colors.white ,
//                borderRadius: BorderRadius.only(
//                    topLeft: Radius.circular(35) ,
//                    topRight:  Radius.circular(35)),
//
//              ),
//                child: ListView.builder(
//              scrollDirection: Axis.vertical,
//                    itemCount: 1,
//                itemBuilder: (context , int index) {
//                return Row(mainAxisAlignment: MainAxisAlignment.start ,
//                  children: [
//          Container( width : 60 , height: 60,padding: EdgeInsets.only(left: 20),
//            child: CircleAvatar ( radius: 20,backgroundColor: Colors.green,
//             backgroundImage:
//             NetworkImage("https://as2.ftcdn.net/v2/jpg/01/95/69/13/500_F_195691368_L2z247vOrgxZOqNQe2In1MpfY21Vo3Cz.jpg")
//             ,
//         ),
//          ),
//                Container(padding: EdgeInsets.only(left: 20),
//                  child: Column(children: [
//                FutureBuilder(future:c2.initPusherClient() ,
//                  builder:(context , AsyncSnapshot snapshot) {
//
//                  return  (c2.usersfetched.obs.value==false)?  CircularProgressIndicator()
//                      :
//                  Text(c2.users[0]['name'].toString() , style: TextStyle(
//                  fontSize: 25 ,
//                  fontWeight: FontWeight.bold
//                  )) ;
//                  }
//
//                  ) ,
//
//                    Container(
//                      child: Column(children: [
//                        Text("Last msg here " , style: TextStyle(
//                            fontSize: 15
//                        ),)
//                      ],),
//                    )
//                  ],
//
//                  ),
//                )
//
//               ],
//
//                );
//     }
//
//     )
//
//
//
//
//            ),
//
//         ],
//       )  )  ,
//
//  ]
//  )
//
//     );
//   }
// }
