import 'package:bazar/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardShppingAddressCheckout extends StatelessWidget {
  final String title;

  const CardShppingAddressCheckout(
      {Key? key,
      required this.title,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color:  AppColor.thirdColor ,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(title,
            style: TextStyle(
                color:  Colors.white ,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
