import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/controller/productdetails_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/view/widget/productdetails/color_productdetails.dart';
import 'package:ecommercecourse/view/widget/productdetails/priceandcount.dart';
import 'package:ecommercecourse/view/widget/productdetails/size_size.dart';
import 'package:ecommercecourse/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/functions/translatefatabase.dart';
import '../widget/productdetails/slidedetails.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ProductDetailsControllerImp controllerImp =
        Get.put(ProductDetailsControllerImp());


    bool i=true;
    return Scaffold(
        persistentFooterAlignment : AlignmentDirectional.bottomCenter,
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,


              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: AppColor.primaryColor,
                  onPressed: () {
                    Get.toNamed(AppRoute.cart);
                  },
                  child:  Text(
                    "47".tr,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ),
        body: GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => ListView(children: [

                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.all(20),
                          child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Sliderdetails(),

                                Container(


                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColor.fourthColor.withOpacity(0.3),
                                          spreadRadius:1,
                                          blurRadius: 20,
                                          offset: Offset(0, 2),
                                          blurStyle: BlurStyle.solid// changes position of shadow
                                        ),
                                      ],
                                      border: Border.all(color: AppColor.thirdColor , width: 1.5),
                                      color: AppColor.backgroundcolor,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(55.0),
                                        bottomLeft: Radius.circular(55.0),
                                      ),
                                    ),
                                    padding:EdgeInsets.all(7),
                                  // decoration: BoxDecoration(border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(30)  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            child: Text(translateDatabase(
                                                controller.itemsModel.itemsNameAr, controller.itemsModel.itemsName ,controller.itemsModel.itemsNameRu),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1!
                                                    .copyWith(
                                                      color: AppColor.fourthColor,
                                                    )),
                                          ),
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

                                  SizedBox(height: 10),
                                  PriceAndCountItems(
                                      onAdd: () {
                                        controller.add();
                                      },
                                      onRemove: () {
                                        controller.remove();
                                      },
                                      price:
                                      "${controller.itemsModel.itemsPriceDiscount}",
                                      count: "${controller.countitems}"),
                                  const SizedBox(height: 10),
                                  if(i=true)
                                  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [Text("Color", style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold,color:  AppColor.fourthColor
                                    )),

                                  SizedBox(height:0),
                  CustomColor()   ,
                                  SizedBox(height: 0),
                                  Text("Size",  style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold,color:  AppColor.fourthColor
                                  )),
                                  SizedBox(height:0),
                                  Customsize(),]),
                                  SizedBox(height:5),
                                  Container(

                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColor.fourthColor.withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                            blurStyle: BlurStyle.inner// changes position of shadow
                                        ),
                                      ],
                                      border: Border.all(color: AppColor.primaryColor , ),
                                      color: AppColor.backgroundcolor,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(55.0),
                                        bottomLeft: Radius.circular(55.0),
                                      ),
                                    ),

                                    child: SizedBox(

                                      height: 100,
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text( translateDatabase(

                                            controller.itemsModel.itemsDescAr, controller.itemsModel.itemsDesc ,controller.itemsModel.itemsDescRu),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300,
                                                color: AppColor.black)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                    ],
                                  ),
                                )




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
