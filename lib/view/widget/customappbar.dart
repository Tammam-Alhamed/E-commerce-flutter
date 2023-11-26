import 'package:ecommercecourse/controller/categories_controller.dart';
import 'package:ecommercecourse/view/widget/categories/listshope.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import 'categories/listshope.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedIconFavorite;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;
  final IconData iconData ;

  final Widget? container;
  const CustomAppBar(
      {Key? key,
      required this.titleappbar,
      this.onPressedSearch,
      required this.onPressedIconFavorite,
      this.onChanged,
      required this.mycontroller,   this.iconData =   Icons.favorite_border_outlined,

       this.container
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(

        height:50,
      margin: EdgeInsets.only(top: 10),
      child:
      Row(children: [
        Expanded(
            child: TextFormField(
          controller: mycontroller,
          onChanged: onChanged,
          decoration: InputDecoration(
              prefixIcon: IconButton(

                  icon: Icon(Icons.search), onPressed: onPressedSearch),
              hintText: titleappbar,
              hintStyle: TextStyle(fontSize: 15),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.grey[200]),
        )),
        SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          width: 60,
          padding: EdgeInsets.symmetric(vertical: 8),
          child: IconButton(
              onPressed: onPressedIconFavorite,
              icon: Icon(
              iconData,
                size: 20,
                color: Colors.grey[600],
              )),
        ),
        SizedBox(width: 10),

        container!

      ]),
    );
  }
}


// Container(
// decoration: BoxDecoration(
// color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
// width: 60,
// padding: EdgeInsets.symmetric(vertical: 8),
//
// child: shopes,
// ),