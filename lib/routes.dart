import 'package:ecommercecourse/bindings/intialbindings.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/middleware/mymiddleware.dart';
import 'package:ecommercecourse/test_view.dart';
import 'package:ecommercecourse/view/screen/address/add.dart';
import 'package:ecommercecourse/view/screen/address/adddetails.dart';
import 'package:ecommercecourse/view/screen/address/view.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/login.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/signup.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/success_signup.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommercecourse/view/screen/auth/verifycodesignup.dart';
import 'package:ecommercecourse/view/screen/cart.dart';
import 'package:ecommercecourse/view/screen/categories.dart';
import 'package:ecommercecourse/view/screen/checkout.dart'; 
import 'package:ecommercecourse/view/screen/homescreen.dart';
import 'package:ecommercecourse/view/screen/items.dart';
import 'package:ecommercecourse/view/screen/itemsdiscount.dart';
import 'package:ecommercecourse/view/screen/language.dart';
import 'package:ecommercecourse/view/screen/myfavorite.dart';
import 'package:ecommercecourse/view/screen/onboarding.dart';
import 'package:ecommercecourse/view/screen/orders/archive.dart';
import 'package:ecommercecourse/view/screen/orders/details.dart';
import 'package:ecommercecourse/view/screen/orders/pending.dart';
import 'package:ecommercecourse/view/screen/productdetails.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () =>   TestView()),
  GetPage(name: AppRoute.cart, page: () => const Cart(),transition: Transition.fadeIn, transitionDuration: Duration(milliseconds: 100)),
  GetPage(
      name: AppRoute.lang, page: () => const Language(), middlewares: [MyMiddleWare()]),
//  Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  //
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen(), transitionDuration: Duration(milliseconds: 100)),
  GetPage(name: AppRoute.categories, page: () => const Categories(),transition: Transition.fadeIn , transitionDuration: Duration(milliseconds: 100)),
  GetPage(name: AppRoute.items, page: () => Items() , transitionDuration: Duration(milliseconds: 100) , transition: Transition.fadeIn),
  GetPage(name: AppRoute.itemsDiscount, page: () => const ItemsDiscount() ,transition: Transition.fadeIn, transitionDuration: Duration(milliseconds: 100)),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails(),transition: Transition.fadeIn, transitionDuration: Duration(milliseconds: 100)),
  GetPage(name: AppRoute.myfavroite, page: () => const MyFavorite(),transition: Transition.fadeIn, transitionDuration: Duration(milliseconds: 100)),
  //
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.checkout, page: () => const Checkout(),transition: Transition.fadeIn, transitionDuration: Duration(milliseconds: 100)),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending(),transition: Transition.fadeIn, transitionDuration: Duration(milliseconds: 100)),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView(),transition: Transition.fadeIn, transitionDuration: Duration(milliseconds: 100)),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails(),transition: Transition.fadeIn, transitionDuration: Duration(milliseconds: 100)),
  GetPage(
      name: AppRoute.addressadddetails, page: () => const AddressAddDetails()), 
];
