import 'package:ecommercecourse/controller/homescreen_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/alertexitapp.dart';
import 'package:ecommercecourse/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return
      GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold (
          appBar: AppBar(
            leadingWidth: 0,
            centerTitle : true,
            bottomOpacity: 0,
            toolbarHeight: 0,
            toolbarOpacity: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: AppColor.backgroundcolor, // <-- SEE HERE
              statusBarIconBrightness: Brightness.light, //<-- For Android SEE HERE (dark icons)
              statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
            ),
          ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColor.primaryColor,
                  onPressed: () {
                    Get.toNamed(AppRoute.cart) ; 
                  },
                  child: const Icon(Icons.shopping_cart_outlined , color: Colors.white,)),

              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,

              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: WillPopScope(onWillPop: alertExitApp ,
              child: controller.listPage.elementAt(controller.currentpage)),

            ));
  }
}
