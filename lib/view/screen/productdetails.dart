import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/controller/myfavoritecontroller.dart';
import 'package:ecommercecourse/controller/productdetails_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/view/widget/productdetails/color_productdetails.dart';
import 'package:ecommercecourse/view/widget/productdetails/priceandcount.dart';
import 'package:ecommercecourse/view/widget/productdetails/size_size.dart';
import 'package:ecommercecourse/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/functions/translatefatabase.dart';
import '../widget/home/custombottomappbarhome.dart';
import '../widget/productdetails/slidedetails.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ProductDetailsControllerImp controllerImp = Get.put(ProductDetailsControllerImp());
    FavoriteController controllerfav = Get.put(FavoriteController());
    MyServices myServices = Get.find();
    return Scaffold(
        persistentFooterAlignment : AlignmentDirectional.bottomCenter,
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: 5),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            height: 50,
              child: Row(
                children: [
                  MaterialButton(
                    minWidth: 200.0,
                    height: 50.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: AppColor.primaryColor,
                      onPressed: () {
                        controllerImp.addtocart( controllerImp.countitems.toString() );
                        // Get.toNamed(AppRoute.cart);
                      },
                      child:  Text(
                        "47".tr,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                  ),
                  SizedBox(width:50,),
                  InkWell(onTap:() {
                    Get.toNamed(AppRoute.cart);}  ,child: Container( height: 70,width: 75,decoration:BoxDecoration(color:AppColor.primaryColor,borderRadius: BorderRadius.circular(15)),child: Icon(Icons.shopping_cart,size: 30,color:Colors.white,),),)
                ],
              ),

            ),

        body: GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => ListView(children: [
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.all(10),

                          child: Column(

                             crossAxisAlignment:  CrossAxisAlignment.start,
                             children: [
                                Sliderdetails(),
                                Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            constraints: const BoxConstraints(
                                              maxHeight: double.infinity,
                                            ),
                                            padding: const EdgeInsets.all(10.0),
                                            width:275,
                                            alignment:myServices.sharedPreferences.getString("lang")=='ar'? Alignment.topRight:Alignment.topLeft,
                                            child: Text(translateDatabase(
                                                controller.itemsModel.itemsNameAr, controller.itemsModel.itemsName ,controller.itemsModel.itemsNameRu),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1!
                                                    .copyWith(
                                                      color: AppColor.fourthColor,
                                                    )),
                                          ),
                                          if(controllerfav.isFavorite[controllerImp.itemsModel.itemsId] != null)
                                          GetBuilder<FavoriteController>(
                                              builder: (controller) => IconButton(
                                                  onPressed: () {
                                                    if (controller.isFavorite[controllerImp.itemsModel.itemsId] ==
                                                        "1") {
                                                      controller.setFavorite(
                                                          controllerImp.itemsModel.itemsId, "0");
                                                      controller
                                                          .removeFavorite(controllerImp.itemsModel.itemsId!);
                                                    } else {
                                                      controller.setFavorite(
                                                          controllerImp.itemsModel.itemsId, "1");
                                                      controller.addFavorite(controllerImp.itemsModel.itemsId!);
                                                    }
                                                  },
                                                  icon: Icon(
                                                    controller.isFavorite[controllerImp.itemsModel.itemsId] == "1"
                                                        ? Icons.favorite
                                                        : Icons.favorite_border_outlined,
                                                    color: AppColor.primaryColor,
                                                  )))
                                        ],
                                      ),

                                      Container(
                                        constraints: const BoxConstraints(
                                          maxHeight: double.infinity,
                                        ),
                                        // decoration: BoxDecoration(
                                        //   boxShadow: [
                                        //     BoxShadow(
                                        //         color: AppColor.grey2.withOpacity(0.3),
                                        //         spreadRadius: 2,
                                        //         blurRadius: 5,
                                        //         offset: Offset(0, 2),
                                        //         blurStyle: BlurStyle.inner// changes position of shadow
                                        //     ),
                                        //   ],
                                        //   color: AppColor.backgroundcolor,
                                        // ),

                                        child: SizedBox(

                                          width: double.infinity,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text( translateDatabase(
                                                controller.itemsModel.itemsDescAr, controller.itemsModel.itemsDesc ,controller.itemsModel.itemsDescRu),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w300,
                                                    height: 1,
                                                    color: AppColor.black)),
                                          ),
                                        ),
                                      ),

                                  SizedBox(height: 10),
                                  PriceAndCountItems(
                                      onAdd: () {
                                        controller.add();
                                      },
                                      onRemove: () {
                                        controller.remove();
                                      },
                                      price:
                                      "${translateDatabase(
                                          controller.itemsModel.itemsPriceDiscount, controller.itemsModel.itemspricedisount_d ,controller.itemsModel.itemspricedisount_d)}",
                                      count: "${controller.countitems}"),
                                  const SizedBox(height: 15),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Row(

                                       // mainAxisAlignment:MainAxisAlignment.end,
                                     //   crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [/*Text("Color", style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold,color:  AppColor.fourthColor
                                      ))*/
//Padding(padding: EdgeInsets.only(left: 10,right: 10)),

                                      if(controller.colors.length!=1)
                                    Column(
                                      children: [
                                      Text(" Select Color", style: TextStyle(fontSize: 14,fontWeight:FontWeight.bold,color:  AppColor.fourthColor
                                      )),
                                        Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(5),),
                                          height: 60,child:
                                        CustomColor(),
                                         width: 170,),
                                      ],
                                    ),


                                       Padding(padding: EdgeInsets.only(left: 30,right: 35)),
                                 /* Text("Size",  style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold,color:  AppColor.fourthColor
                                    )),*/

                                        if( controller.sizes.length!=1)
                                        Flexible(
                                          child: Container(
                                         margin:controller.colors.length==1  ? myServices.sharedPreferences.getString("lang")!='ar' ? EdgeInsets.only(left: 150):EdgeInsets.only(right: 150):EdgeInsets.only(left: 0),
                                            decoration: BoxDecoration(
                                              border: Border(bottom: BorderSide(color: AppColor.primaryColor)),


                                            ),
                                            height:60,child:Customsize(),width: 110,
                                          ),
                                        ),

                                      ]),
                                  ),
                                  SizedBox(height:5),

                                  const SizedBox(height: 10),
                                    ],
                                  ),




                                // Text("Color",
                                //     style: Theme.of(context).textTheme.headline1!.copyWith(
                                //           color: AppColor.fourthColor,
                                //         )),
                                // const SizedBox(height: 10),
                                // const SubitemsList()
                              ]),


                      ))
                ])));
  }
}
