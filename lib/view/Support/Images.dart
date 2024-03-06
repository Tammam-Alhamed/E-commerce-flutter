import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/constant/imgaeasset.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class Images extends StatelessWidget {
  final String url ;
  final double raduis ;
  final double? width ;
  final double? height ;
  const Images({super.key,
    required this.url,
    required this.raduis,
    this.height,
    this.width,
  });


  @override
  Widget build(BuildContext context) {


    return
    CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context,imageProvider)=>Container(decoration: BoxDecoration(borderRadius:BorderRadius.all( Radius.circular(raduis),)
          ,image: DecorationImage(image:imageProvider , centerSlice: Rect.largest )),),
      placeholder: (BuildContext context, String url) => Container(
        width: 130,
        height: 140,
        decoration: BoxDecoration(
            color: AppColor.backgroundcolor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20)),
        child: Center(child:  Image.asset(AppImageAsset.logo ,width: 100,)),
      ),
      height: height,
      width: width,
      fadeInDuration: const Duration(milliseconds: 200),
      fit: BoxFit.cover,
    );
  }

  }

