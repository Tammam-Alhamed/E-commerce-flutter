import 'package:bazar/view/Support/Images.dart';
import 'package:bazar/controller/home_shope_controller.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/data/model/itemsmodel.dart';
import 'package:bazar/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomeShopeControllerImp> {
   ListItemsHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ItemsHome(
                itemsModel: ItemsModel.fromJson(controller.items[index]), itemnum: index,);
          }),
    );
  }
}

class ItemsHome extends GetView<HomeShopeControllerImp>  {
  final ItemsModel itemsModel;
  final int itemnum;
  const ItemsHome(  {Key? key, required this.itemsModel, required this.itemnum }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white,
      onTap: () {
        controller.goToPageProductDetails(itemsModel , itemnum);
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            margin: const EdgeInsets.only(right: 20),
            child: Images(
              url: "${AppLink.imagestItems}/${itemsModel.itemsImage}",
              raduis: 12.0,
              width: 140,
              height: 130,
            )
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                color: AppColor.home.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20)),
            height: 170,
            width: 170,
          ),
    //       Positioned(
    //         bottom: 130,
    //           left: 10,
    //           child: Text(
    // translateDatabase(
    // itemsModel.itemsNameAr, itemsModel.itemsName ,itemsModel.itemsNameRu),
    //             style: const TextStyle(
    //                 color: AppColor.primaryColor,
    //                 // fontWeight: FontWeight.bold,
    //                 fontSize: 14),
    //           ))
        ],
      ),
    );
  }
}
