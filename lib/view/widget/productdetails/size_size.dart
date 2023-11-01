import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class Customsize extends  GetView<ItemsControllerImp>{
  const Customsize({super.key});

  @override
  Widget build(BuildContext context) {
    return SizeSelector(
      sizes: [
        "mm","l","xl","xxxl"
      ],
    );
  }
}





class SizeSelector extends StatefulWidget {
  const SizeSelector({
    super.key,
    required this.sizes,
  });
  final List<String> sizes;
  @override
  sizeRowState createState() => sizeRowState();
}

class sizeRowState extends State<SizeSelector> {
  int currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widget.sizes.length,
            (index) {
          return InkWell(
            onTap: () {
              setState(() {
                currentTab = index;
              });
            },
            child: Container(

              alignment:Alignment.center,
              padding: const EdgeInsets.all(2.0),
              width:30,
              height: 26,
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                shape: BoxShape.rectangle,
                border: currentTab == index
                    ? Border.all(color: AppColor.thirdColor, width: 1.5)
                    : null,
              ),
              child: Container(
             
                  child: Text( widget.sizes[index],style:TextStyle(fontSize: 12,fontWeight: FontWeight.bold,) ,),
                alignment:Alignment.topCenter,
                width: 24,
                height: 22,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(5),
                  shape: BoxShape.rectangle,
                  //color: widget.sizes[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

