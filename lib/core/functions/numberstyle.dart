import 'package:ecommercecourse/core/functions/translatefatabase.dart';
import 'package:get/get.dart';

String formatAmount(var x,var y, var z){
  String price = "${translateDatabase(
      x, y,z)}";
  String priceInText = "";
  int counter = 0;
  for(int i = (price.length - 1);  i >= 0; i--){
    counter++;
    String str = price[i];
    if((counter % 3) != 0 && i !=0){
      priceInText = "$str$priceInText";
    }else if(i == 0 ){
      priceInText = "$str$priceInText";

    }else{
      priceInText = ",$str$priceInText";
    }
  }
  return priceInText.trim();
}