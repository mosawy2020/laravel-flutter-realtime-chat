import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:realtimechat/getx%20chat/view/onlineview.dart';
import 'package:http/http.dart' as http;
String AUTH_URL = "http://10.0.2.2:8000/api/broadcasting/auth" ;
// String BEARER_TOKEN = "" ;
class realtimecontroller extends  GetxController{

  onInit() ;
  var users = [] ;
  RxInt userscount = 0.obs ;
  var  lastmsg  = < Map <String , String> > [].obs ;
  var i = 0.obs;
  // RxMap <double  , String >  onlineusers  = {0.0:"none"}.obs    ;
  var usersmap = < Map <int , String> >[].obs;
  RxBool usersfetched = false.obs ;
  RxBool call = false.obs;


Future<bool>  getonlinemethod( ) async {

    var pusherClient  = await pusherconncect() ;
  Channel channel = await pusherClient.subscribe("presence-online");
    int i = 0 ;
     users=[];
  var z = await channel.bind('pusher:subscription_succeeded', (members) {
    // print(members.toJson().toString());
  String str = members!.data.toString();
  String regexString = r'(?<=\{)(.*?)(?=\})';
  RegExp regExp = new RegExp(regexString);
  var matches = regExp.allMatches(str);
  matches.forEach((element) {
  String jsonString = "{" + element.group(0)! + "}";
  var user = jsonDecode(jsonString);
  // print(user["name"].toString());
  users.insert(i, user) ;
  i++ ;
  // print(user.toString());
  // print (user["name"]+user["id"].toString());
  // print (user["id"].runtimeType) ;
  Map<int , String> cur  = new Map() ;
  cur [user["id"].round()] = user["name"] ;
  usersmap.value.add(cur) ;
  userscount.value++ ;
   });
  usersfetched.value=true;
// print(usersmap.value) ;
  } ) ;

  var added = await channel.bind('pusher:member_added', (member) async {


       if (member!.userId!=null) {
         var url = Uri.parse('http://10.0.2.2:8000/api/getuser?id=${member.userId}');
         var response = await http.get(url);
         if (response.statusCode == 200 ) {
           var data = jsonDecode(response.body) ;
           var name = data["data"] ["name"]  ; 

           Map<int,String> cur = new Map() ;
           cur [int.parse(member.userId!)] =name ;

           for (var item in usersmap) {
             if (item.entries.first.value==member.userId!) return ;
           }
           usersmap.value.add(cur) ;
           userscount.value ++;
           print(usersmap) ;
         }

           }
  }) ;
    var removed = await channel.bind('pusher:member_removed', (member) async {

    if (member!.userId!=null) {
      var url = Uri.parse('http://10.0.2.2:8000/api/getuser?id=${member.userId}');
      var response = await http.get(url);
      if (response.statusCode == 200 ) {
        var data = jsonDecode(response.body) ;
        var name = data["data"] ["name"] ;
        Map<int,String> cur = new Map() ;
        cur [int.parse(member.userId!)] =name ;

for (var item in usersmap.value) {
  if (item.entries.first.value==member.userId!) usersmap.value.remove(item) ;
}

        print(usersmap) ;
        userscount.value --;
      }
    }
    }
    ) ;

      // call.value=false;
       return true ;
 }

  readmessages (String msg) async {
   final storage = new FlutterSecureStorage();

   String? id = await storage.read(key: "id");
  PusherClient pusher =await pusherconncect() ;
   pusher.connect();

   pusher.onConnectionStateChange((state) {
     print("previousState: ${state?.previousState}, currentState: ${state?.currentState}");
   });

   pusher.onConnectionError((error) {
     print("error: ${error?.message}");
   });

// Subscribe to a private channel
   Channel channel =  await pusher.subscribe("public-channel.${id}") ;


// Bind to listen for events called "order-status-updated" sent to "private-orders" channel
   var x = await channel.bind("PublicEvent", ( event) async {
     print(event?.data);
     Map<String , String> cur = new Map() ;
     cur ["r"] =  jsonDecode(event!.data!)["payload"].toString() ;
     lastmsg.value.add( cur )  ;
     print(lastmsg);
     i++;
     // print( jsonDecode(event!.data!)["payload"]) ;
   }
   );

 }

  sendmessage (String msg , String id) async {

    var headers = {
      'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Accept': ''
    };
    var url = Uri.parse('http://10.0.2.2:8000/fire/public');

    var response = await http.post(url, body:{'payload': '$msg',
        'id': '$id'});

      if (response.statusCode==200){
        Map<String , String> cur = new Map() ;
        cur ["s"] =  msg ;
        lastmsg.value.add( cur )  ;
        i++;
        return true ;
      }
      else print(response.reasonPhrase.toString()+response.statusCode.toString());
      return false ;

  }

 pusherconncect () async {
   final storage = new FlutterSecureStorage();

   String? BEARER_TOKEN = await storage.read(key: "token");
   PusherOptions options = PusherOptions(
     // cluster: PUSHER_CLUSTER,
     encrypted: false,
     wssPort: 6001,
     wsPort: 6001,
     host: '10.0.2.2',
     auth: PusherAuth(
       AUTH_URL,
       headers: {
         'Authorization': 'Bearer $BEARER_TOKEN',
         'Content-Type': 'application/json',
         'Accept': 'application/json'
       },
     ),
   );

   PusherClient pusherClient = PusherClient(
     "local",
     options,
     autoConnect: false,
     enableLogging: true,
   );

   pusherClient.connect() ;

   return pusherClient ;
 }




}