import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/data/model/slidesmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class Home extends StatelessWidget {
  final slidesmodel slidesModel;
  const Home({Key? key, required this.slidesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return   Stack(
        children: [
    Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(40.0)),
    child: Stack(children: <Widget>[
    InkResponse(
    child: Image.network(
              "${AppLink.imagestSlides}/${slidesModel.slidesImage}",
               height: 200,
               width:MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
            ),
          )
        ]
    )))
  ]);



  }
}
