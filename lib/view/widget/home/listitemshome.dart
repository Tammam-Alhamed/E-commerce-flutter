import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/controller/home_shope_controller.dart';
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/functions/translatefatabase.dart';
import 'package:ecommercecourse/data/model/categoriesmodel.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/data/model/shopesmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/gestures.dart';
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
                itemsModel: ItemsModel.fromJson(controller.items[index]));
          }),
    );
  }
}

class ItemsHome extends GetView<HomeShopeControllerImp>  {
  final ItemsModel itemsModel;

  const ItemsHome(  {Key? key, required this.itemsModel, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            margin: const EdgeInsets.only(right: 20),
            child: CachedNetworkImage(
              imageBuilder: (context,imageProvider)=>Container(decoration: BoxDecoration(borderRadius:BorderRadius.all( Radius.circular(12.0),),
                  image: DecorationImage(image:imageProvider , centerSlice: Rect.largest )),),

              height: 130,
              width: 140,
              fit: BoxFit.fill, imageUrl: '${AppLink.imagestItems}/${itemsModel.itemsImage}',
            ),
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
          Positioned(
              left: 10,
              child: Text(
    translateDatabase(
    itemsModel.itemsNameAr, itemsModel.itemsName ,itemsModel.itemsNameRu),
                style: const TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 14),
              ))
        ],
      ),
    );
  }
}
