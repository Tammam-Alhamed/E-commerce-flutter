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
        extendBodyBehindAppBar: true,
        persistentFooterAlignment : AlignmentDirectional.bottomCenter,
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: 5),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            height: 40,


              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
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
                        padding: const EdgeInsets.all(10),
                          child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Sliderdetails(),
 Column(
                                    children: [
                                      Row(
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

                                      Container(

                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: AppColor.grey2.withOpacity(0.3),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: Offset(0, 2),
                                                blurStyle: BlurStyle.inner// changes position of shadow
                                            ),
                                          ],

                                          color: AppColor.backgroundcolor,

                                        ),

                                        child: SizedBox(

                                          height: 120,
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

                                  Row(
                                      mainAxisAlignment:MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [Text("Color", style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold,color:  AppColor.fourthColor
                                    )),
Padding(padding: EdgeInsets.only(left: 10,right: 10)),
                                  SizedBox(height:50,child: CustomColor() ,width: 80,),

                                  SizedBox(height: 0),
                                      Padding(padding: EdgeInsets.only(left: 10,right: 10)),
                                  Text("Size",  style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold,color:  AppColor.fourthColor
                                  )),
                                  SizedBox(height:50,child:Customsize(),width: 80,),

                                    ]),
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
