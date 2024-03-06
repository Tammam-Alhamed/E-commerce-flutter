import 'package:cached_network_image/cached_network_image.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/constant/imgaeasset.dart';
import 'package:bazar/data/model/itemsmodel.dart';
import 'package:bazar/linkapi.dart';
import 'package:flutter/material.dart';

class CustomItemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final void Function()? onAdd;
  final void Function()? onRemove;
  final void Function()? delete;
  const CustomItemsCartList({
    Key? key,
    required this.name,
    required this.price,
    required this.count,
    required this.imagename,
    required this.onAdd,
    required this.onRemove,
    required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      constraints: const BoxConstraints(
        maxHeight: double.infinity,
      ),
      margin: EdgeInsets.only(bottom: 10),

        decoration: BoxDecoration(
            color: AppColor.grey2.withOpacity(0.2) ,
            borderRadius: BorderRadius.circular(20)),
        child: Row(children: [
          Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageBuilder: (context,imageProvider)=>Container(decoration: BoxDecoration(borderRadius:BorderRadius.all( Radius.circular(25.0),)
                    ,image: DecorationImage(image:imageProvider  )),),
                fadeInDuration: const Duration(milliseconds: 500),
                imageUrl: "${AppLink.imagestItems}/$imagename",
                height: 80,
                placeholder: (BuildContext context, String url) => Container(
                  width: 320,
                  height: 240,
                  decoration: BoxDecoration(
                      color: AppColor.backgroundcolor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(child:  Image.asset(AppImageAsset.logo )),
                ),
              )),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Text(name, style: TextStyle(height:1.2,fontSize: 13)),
                subtitle: Text(price,
                    style:
                        TextStyle(color: AppColor.primaryColor, fontSize: 15)),
              )),
          Container(
            alignment: Alignment.center,
              child: IconButton(onPressed: delete, icon: Icon(Icons.delete))),
          Expanded(
              child: Column(
            children: [
              Container(
                  height: 35,
                  child: IconButton(onPressed: onAdd, icon: Icon(Icons.add))),
              Container(
                  height: 30,
                  child: Text(
                    count,
                    style: TextStyle(fontFamily: "sans"),
                  )),
                  Container(
                      height: 25,
                      child: IconButton(onPressed: onRemove, icon: Icon(Icons.remove))),

                ],
          ))
        ]),
      );
  }
}
