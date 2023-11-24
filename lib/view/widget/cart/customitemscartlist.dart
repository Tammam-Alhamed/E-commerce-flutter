import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
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
      margin: EdgeInsets.only(bottom: 10),
        height: 100,
        decoration: BoxDecoration(
            color: AppColor.grey2.withOpacity(0.2) ,
            borderRadius: BorderRadius.circular(20)),
        child: Row(children: [
          Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: "${AppLink.imagestItems}/$imagename",
                height: 80,
              )),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Text(name, style: TextStyle(fontSize: 15)),
                subtitle: Text(price,
                    style:
                        TextStyle(color: AppColor.primaryColor, fontSize: 17)),
              )),
          Container(
              height: 30,
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
