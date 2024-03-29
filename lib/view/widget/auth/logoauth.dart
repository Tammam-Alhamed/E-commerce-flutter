import 'package:bazar/core/constant/imgaeasset.dart'; 
import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(

        radius: 80,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(0), // Border radius
          child: ClipOval(
            child: Image.asset(
              AppImageAsset.logoAuth,
            ),
          ),
        ));
  }
}
