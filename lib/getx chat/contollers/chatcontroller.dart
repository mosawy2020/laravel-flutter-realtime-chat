import 'package:get/get.dart';

class chatcontroller extends  GetxController{

RxList items =  [].obs ;
Map<String,String>? content ;
RxInt i = 0.obs ;
addmethod (){

  items.add("newone"+i.toString()) ;
  // content! ["newone"]="sent" ;
  i++ ;
}
removemethod (){
  items.remove("newone2") ;

  // items.removeAt(items.length-1) ;
}



}