import 'package:bazar/core/constant/imgaeasset.dart';
import 'package:bazar/view/Support/Images.dart';
import 'package:bazar/controller/home_shope_controller.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/functions/translatefatabase.dart';
import 'package:bazar/data/model/itemsmodel.dart';
import 'package:bazar/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListNewItemsHome extends GetView<HomeShopeControllerImp> {
  const ListNewItemsHome({super.key});
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      padding: EdgeInsets.only(bottom: 10),
      shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.itemsNew.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return ItemsHome(
                itemsModel: ItemsModel.fromJson(controller.itemsNew[index]));
          }, gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 0.6),);
  }
}

class ItemsHome extends GetView<HomeShopeControllerImp>  {
  final ItemsModel itemsModel;
  String formatAmount(){
    String price = "${translateDatabase(
        itemsModel.itemsPrice, itemsModel.itemsPrice,itemsModel.itemsPrice)}";
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
  String formatAmount1(){
    String price = "${translateDatabase(
        itemsModel.itemspricedisount_d, itemsModel.itemspricedisount_d ,itemsModel.itemspricedisount_d)}";
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

  const ItemsHome(  {super.key, required this.itemsModel, });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.white,
        hoverColor: Colors.white,
        focusColor: Colors.white,
        highlightColor: Colors.white,
        onTap: () {
          itemsModel.itemsSold !="0" ? "" :controller.goToPageProductDetails(itemsModel);
        },
        child: InkWell(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin:const EdgeInsets.only(bottom: 5),
                          child: Images(
                            url: "${AppLink.imagestItems}/${itemsModel.itemsImage!}",
                            raduis: 7.0,
                            height: 100,
                            width: 100,
                          )
                      ),

                      const SizedBox(height: 5,),

                      Container(
                        padding: const EdgeInsets.only(left:3 , right: 3),
                        //margin: EdgeInsets.only(left: 5 , right: 10),
                        alignment: Alignment.center,
                        child: Text(
                            translateDatabase(
                                itemsModel.itemsNameAr, itemsModel.itemsName ,itemsModel.itemsNameRu),
                            textAlign:TextAlign.center,
                            style: const TextStyle(
                              height:1,
                              overflow: TextOverflow.clip,
                              color: AppColor.black,
                              fontSize: 15,
                            )),
                      ),

                      if( itemsModel.itemsDiscount == "0")
                        const SizedBox(height: 10,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if(itemsModel.itemsSold != "0")
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                child: Image.asset( translateDatabase(
                                    AppImageAsset.Sold_a, AppImageAsset.Sold ,AppImageAsset.Sold_r),width:30,height: 45,),
                              )
                            //Image.asset(AppImageAsset.Sold , width: 75,height: 80,)
                            else
                              if(itemsModel.itemsDiscount!="0")
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Column(
                                    children: [
                                      Text("${formatAmount1()} ${"59".tr}",
                                          style: const TextStyle(
                                              color: AppColor.primaryColor,
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "sans")),
                                      Text("${formatAmount()} ${"59".tr}",
                                          style: const TextStyle(decoration: TextDecoration.lineThrough,
                                              color: AppColor.primaryColor,
                                              fontSize: 10,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: "sans"))],),
                                )


                              else Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: Text("${formatAmount()} ${"59".tr}",
                                    style: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,

                                        fontFamily: "sans")),
                              ),
                          ],
                        ),



                    ]),
              ),
              if (itemsModel.itemsDiscount != "0")   Positioned(
                  top: 4,
                  left: 4,
                  child: Image.asset(AppImageAsset.saleOne , width: 40,)),
              if (itemsModel.itemsNew == "1")   Positioned(
                  top: -2,
                  right: -2,
                  child: Image.asset(AppImageAsset.NEW , width: 50,))
            ],
          ),
        ));
  }
}
