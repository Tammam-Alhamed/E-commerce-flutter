
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CustomColor extends  GetView<ItemsControllerImp>{
  const CustomColor({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleColorRow(
      colors: [
        AppColor.grey,
        AppColor.secondColor,
        AppColor.primaryColor,
        AppColor.black
      ],
    );
  }
}

class CircleColorRow extends StatefulWidget {
  const CircleColorRow({
    super.key,
    required this.colors,
  });
  final List<Color> colors;
  @override
  State<CircleColorRow> createState() => _CircleColorRowState();
}

class _CircleColorRowState extends State<CircleColorRow> {
  int currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widget.colors.length,
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
              width: 20,
              height: 20,
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: currentTab == index
                    ? Border.all(color: AppColor.thirdColor, width: 1.5)
                    : null,
              ),
              child: Container(
                alignment:Alignment.center,
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.colors[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}