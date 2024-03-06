// import 'package:bazar/controller/categories_controller.dart';
// import 'package:bazar/core/class/handlingdataview.dart';
// import 'package:bazar/core/constant/color.dart';
// import 'package:bazar/core/constant/routes.dart';
// import 'package:bazar/view/screen/home.dart';
// import 'package:bazar/view/widget/customappbar.dart';
// import 'package:bazar/view/widget/items/listcategoirseitems.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class Items extends StatelessWidget {
//   const Items({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     CategoriesControllerImp controller = Get.find();
//
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         leadingWidth: 0,
//         centerTitle : true,
//         bottomOpacity: 0,
//         toolbarHeight: 0,
//         toolbarOpacity: 0,
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(15),
//         child: ListView(children: [
//           CustomAppBar(
//             mycontroller: controller.search!,
//             titleappbar: "39".tr,
//             // onPressedIcon: () {},
//             onPressedSearch: () {
//               controller.onSearchItems();
//             },
//             onChanged: (val) {
//               controller.checkSearch(val);
//             },
//             onPressedIconFavorite: () {
//               Get.toNamed(AppRoute.myfavroite);
//             },
//             onPressed: (String ) { controller.onSearchItems(); },
//           ),
//
//           const SizedBox(height: 20),
//           const ListCategoriesItems(),
//           GetBuilder<CategoriesControllerImp>(
//               builder: (controller) => HandlingDataView(
//                   statusRequest: controller.statusRequest,
//                   widget: !controller.isSearch
//                       ? GridView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: controller.data.length,
//                       gridDelegate:
//                       const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2, childAspectRatio: 0.7),
//                     itemBuilder: (BuildContext context, int index) {
//
//                     },)
//                       : ListItemsSearch(listdatamodel: controller.listdata)))
//         ]),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // favoriteController.isFavorite[controller.data[index]
// // ['items_id']] = controller.data[index]['favorite'];
