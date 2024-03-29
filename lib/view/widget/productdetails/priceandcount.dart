import 'package:bazar/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class PriceAndCountItems extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String price;
  final String count;
  const PriceAndCountItems(
      {Key? key,
      required this.onAdd,
      required this.onRemove,
      required this.price,
      required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        children: [
          Row(
            children: [
              IconButton(onPressed: onAdd, icon:   Icon(LineAwesome.plus_circle_solid),),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 2),
                  width: 50,
                  height: 30,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(10),color: AppColor.secondColor),
                  child: Text(
                    count,
                    style: const TextStyle(fontSize: 15, height: 1.1),
                  )),
              IconButton(onPressed: onRemove, icon: const Icon(LineAwesome.minus_circle_solid),),
            ],
          ),
          Spacer(flex:2 ,),
          Text(
            "$price ${"59".tr}",
            style: const TextStyle(

                color: AppColor.primaryColor, fontSize: 20, height: 1.1),

          )
        ],
      ),
    );
  }
}
