import 'package:bazar/controller/categories_controller.dart';
import 'package:bazar/controller/favorite_controller.dart';
import 'package:bazar/controller/items_controller.dart';
import 'package:bazar/core/class/handlingdataview.dart';
import 'package:bazar/core/constant/imgaeasset.dart';
import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/data/model/itemscolorsmodel.dart';
import 'package:bazar/data/model/itemsimagesmodel.dart';
import 'package:bazar/data/model/itemsmodel.dart';
import 'package:bazar/data/model/itemssizesmodel.dart';
import 'package:bazar/linkapi.dart';
import 'package:bazar/view/Support/Images.dart';
import 'package:bazar/view/screen/home.dart';
import 'package:bazar/view/widget/customappbar.dart';
import 'package:bazar/view/widget/items/customlistitems.dart';
import 'package:bazar/view/widget/items/listCat.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../../core/constant/color.dart';
import '../widget/customappbaritems.dart';
import '../widget/drawer.dart';
import '../widget/items/floatingButtom.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
      ItemsControllerImp controller = Get.put(ItemsControllerImp() , permanent: true);
      FavoriteController controllerFav = Get.put(FavoriteController(),permanent: true);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return WillPopScope(
      onWillPop: () async {
        if (_scaffoldKey.currentState!.isDrawerOpen) {
          // Close the drawer without deleting the controllers
          Navigator.of(context).pop(); // Close the Drawer
          return false; // Prevent back navigation
        } else {
          // If not coming from the drawer, delete the controller and go back
          await Get.delete<ItemsControllerImp>(force: true);
          await Get.delete<FavoriteController>(force: true);
          return true; // Allow back navigation
        }
      },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value:const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, //i like transaparent :-)
            systemNavigationBarColor: Colors.white10, // navigation bar color
            statusBarIconBrightness: Brightness.dark, // status bar icons' color
            systemNavigationBarIconBrightness:Brightness.dark, //navigation bar icons' color
          ),
          child: Scaffold(
            key: _scaffoldKey,
            drawer:MyCustomDrawer(),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColor.backgroundcolor,
              leadingWidth: 0,
              centerTitle : true,
              bottomOpacity: 0,
              toolbarHeight: 0,
              toolbarOpacity: 0,
            ),
            body: CustomScrollView(
              controller: controller.scrollController ,
              anchor: 0.006,
              physics: const BouncingScrollPhysics(),
              slivers:<Widget> [

              SliverAppBar(

              automaticallyImplyLeading: false,
              backgroundColor: AppColor.backgroundcolor,
              primary: false,

              snap: false,
              stretch: true,
              floating: true,
              pinned: true,
              centerTitle: false,
              iconTheme: const IconThemeData(color: Colors.black),
              title: Text("${'131'.tr}") ,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0), ), ),
                actions: [Container(width:200,child: CustomAppBarItems(onPressedIconFavorite: () {
                  Get.toNamed(AppRoute.myfavroite);
                },),)],
              ),
                SliverList.list(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14),
                      child: ListView(
                        shrinkWrap: true,
                          controller: controller.scrollController1 ,

                          children: [

                        const SizedBox(height: 20),
                        // const ListCategoriesItems(),
                        GetBuilder<ItemsControllerImp>(
                            builder: (controller) =>
                                HandlingDataView(
                                    statusRequest: controller.statusRequest,
                                    widget: !controller.isSearch
                                        ? GridView.builder(
                                            shrinkWrap: true,
                                            physics: const BouncingScrollPhysics(),
                                            itemCount:controller.data.length
                                        ,
                                            gridDelegate:
                                            kIsWeb ? const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 5, childAspectRatio: 0.6)
                                            :
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2, childAspectRatio: 0.6),
                                            itemBuilder: (BuildContext context, index) {
                                              controllerFav.isFavorite[controller.data[index]['items_id']] = controller.data[index]['favorite'];
                                                return AnimationConfiguration.staggeredGrid(
                                                  position: index,
                                                  duration: const Duration(milliseconds: 600),
                                                  columnCount: controller.data.length,
                                                  child: SlideAnimation(
                                                    curve: Curves.ease,
                                                    verticalOffset: 50.0,
                                                    child: FadeInAnimation(
                                                      child: CustomListItems(
                                                          itemsModel: ItemsModel.fromJson(
                                                              controller.data[index]), itemnum: index,),
                                                    ),
                                                  ),
                                                );

                                            })

                                        : ListItemsSearch(
                                        listdatamodel: controller.listdata))),


                      ]),
                    ),
                  ],
                ),
              ],
            ),
            floatingActionButton:  SpeedDial(
              closeDialOnPop: false,
              spacing: 30,
              childrenButtonSize : const Size(60.0, 70.0),
              animatedIcon: AnimatedIcons.home_menu,
                spaceBetweenChildren:10,
              animatedIconTheme: const IconThemeData(size: 22.0),
              // this is ignored if animatedIcon is non null
              // child: Icon(Icons.add),
              visible: true,
              curve: Curves.fastOutSlowIn,
              overlayColor: Colors.black,
              overlayOpacity: 0.5,
onPress:(){
  Get.toNamed(AppRoute.homepage);
},
              backgroundColor: AppColor.primaryColor,
              foregroundColor: Colors.white,
              elevation: 8.0,
              shape: const CircleBorder(),
             /* children: [
                SpeedDialChild(
                    child: const Icon(Icons.sort_sharp, color:AppColor.primaryColor),
                    backgroundColor: Colors.yellow,
                    label: 'Sort',
              labelBackgroundColor:Colors.white,
                    labelStyle: const TextStyle(fontSize: 18.0,color:AppColor.primaryColor),
                    onTap: () {
           /*   Get.bottomSheet(
            backgroundColor:Colors.white,
              enterBottomSheetDuration:const Duration(milliseconds: 325),
              exitBottomSheetDuration :const Duration(milliseconds: 325),
              StatefulBuilder(
              builder: (context, setState) {
              return Container(height:350,child: RadioListTileExample());}));*/}
                ),
               /* SpeedDialChild(
                  child: Icon(Icons.filter_alt_rounded, color:AppColor.primaryColor,),
                  backgroundColor:Colors.yellow,
                  label: 'Filter',
                  labelBackgroundColor:Colors.white,
                  labelStyle:  TextStyle(fontSize: 18.0,color:AppColor.primaryColor),
                  onTap: () {

                    Get.bottomSheet(
                        backgroundColor:Colors.white,
                        enterBottomSheetDuration: Duration(milliseconds: 325),
                        exitBottomSheetDuration : Duration(milliseconds: 325),
                        StatefulBuilder(
                            builder: (context, setState) {
                              return Container(
                                height: 255,
                                  child: RadioListTileExample());}));},
                ),*/

              ],*/
            ),


          ),
        ),
      );
  }
}