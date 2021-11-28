import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laravel_echo/laravel_echo.dart';
import 'package:pusher_client/pusher_client.dart';
class getonline extends GetxController {
   String PUSHER_KEY = 'local';
// const String PUSHER_KEY = 'YOUR_PUSHER_KEY_HERE';
   String PUSHER_CLUSTER = 'local';
  String BEARER_TOKEN = '171|cMk0ZqENXGeCXlvs1xZajjx8lV6cmJbQ6gQmjl4k';
  String AUTH_URL = 'http://10.0.2.2:8000/api/broadcasting/auth';
  RxBool usersfetched = false.obs;
  var users = [];
// var x ;
   initPusherClient() async {
    PusherOptions options;

    if (PUSHER_KEY == 'locall') {
      //
      // Sample configuration for laravel-websockets
      //
      options = PusherOptions(

        // host: '10.0.2.2',
        // wsPort: 6001,
        // wssPort: 6001,
        // cluster: 'eu',
        // encrypted: false,
        auth: PusherAuth(
          AUTH_URL,
          headers: {
            'Authorization': 'Bearer $BEARER_TOKEN',
            //'Content-Type': 'application/json',
            //  'Accept': 'application/json'
          },
        ),
      );
    }

    else {

      options = PusherOptions(
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
    }

    PusherClient pusherClient = PusherClient(
      PUSHER_KEY,
      options,
      autoConnect: false,
      enableLogging: true,
    );
    pusherClient.connect() ;

    pusherClient.onConnectionError((error) {
      print(error?.message);
    });
    int i = 0  ;
    Echo echo = new Echo(
      broadcaster: EchoBroadcasterType.Pusher,
      client: pusherClient,
    );
       Channel channel = await pusherClient.subscribe("presence-online");

   var z = await channel.bind('pusher:subscription_succeeded', (members) {
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
        print(user.toString()+i.toString());
        usersfetched.value=true ;
         });
          } ) ;

       //  if (i>1)
       //  else print(i);
         return users ;
    }

}
