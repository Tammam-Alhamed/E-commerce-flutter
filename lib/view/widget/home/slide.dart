import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/data/model/slidesmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final slidesmodel slidesModel;
  const Home({Key? key, required this.slidesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return   Stack(
        children: [
          Container(
            //padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            // margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.network(
              "${AppLink.imagestSlides}/${slidesModel.slidesImage}",
              //  height: 100,
              // width: 150,
              //  fit: BoxFit.fill,
            ),
          )
        ]
    );




  }
}
