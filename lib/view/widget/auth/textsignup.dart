import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;
  const CustomTextSignUpOrSignIn(
      {Key? key,
      required this.textone,
      required this.texttwo,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(textone),
        InkWell(
          onTap: onTap,
          child: Text(texttwo,
              style:  TextStyle(fontSize:11,
                  color: AppColor.primaryColor, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
