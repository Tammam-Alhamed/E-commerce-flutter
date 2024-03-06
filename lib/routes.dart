import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/core/middleware/mymiddleware.dart';
import 'package:bazar/view/screen/address/add.dart';
import 'package:bazar/view/screen/address/adddetails.dart';
import 'package:bazar/view/screen/address/view.dart';
import 'package:bazar/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:bazar/view/screen/auth/login.dart';
import 'package:bazar/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:bazar/view/screen/auth/signup.dart';
import 'package:bazar/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:bazar/view/screen/auth/success_signup.dart';
import 'package:bazar/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:bazar/view/screen/auth/verifycodesignup.dart';
import 'package:bazar/view/screen/cart.dart';
import 'package:bazar/view/screen/categories.dart';
import 'package:bazar/view/screen/checkout.dart';
import 'package:bazar/view/screen/homescreen.dart';
import 'package:bazar/view/screen/items.dart';
import 'package:bazar/view/screen/itemsdiscount.dart';
import 'package:bazar/view/screen/language.dart';
import 'package:bazar/view/screen/myfavorite.dart';
import 'package:bazar/view/screen/notification.dart';
import 'package:bazar/view/screen/onboarding.dart';
import 'package:bazar/view/screen/orders/archive.dart';
import 'package:bazar/view/screen/orders/details.dart';
import 'package:bazar/view/screen/orders/pending.dart';
import 'package:bazar/view/screen/productdetails.dart';
import 'package:get/get.dart';


const duration = Duration(milliseconds: 600);
List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () =>   TestView()),
  GetPage(name: AppRoute.cart, page: () => const Cart(),transition: Transition.cupertino, transitionDuration: duration ),
  GetPage(name: AppRoute.notification, page: () => const NotificationView(),transition: Transition.cupertino, transitionDuration: duration ),
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
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen(), transitionDuration: duration,transition: Transition.cupertino),
  GetPage(name: AppRoute.categories, page: () => const Categories(),transition: Transition.cupertino , transitionDuration: duration ,  ),
  GetPage(name: AppRoute.items, page: () => const Items() , transitionDuration: duration , transition: Transition.cupertino ,),
  GetPage(name: AppRoute.itemsDiscount, page: () => const ItemsDiscount() ,transition: Transition.cupertino, transitionDuration: duration ,),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails(),transition: Transition.cupertino, transitionDuration: duration, ),
  GetPage(name: AppRoute.myfavroite, page: () => const MyFavorite(),transition: Transition.cupertino, transitionDuration: duration,),
  //
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.checkout, page: () => const Checkout(),transition: Transition.cupertino, transitionDuration: duration ),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending(),transition: Transition.cupertino, transitionDuration: duration ),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView(),transition: Transition.cupertino, transitionDuration: duration),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails(),transition: Transition.cupertino, transitionDuration: duration ),
  GetPage(
      name: AppRoute.addressadddetails, page: () => const AddressAddDetails()),
];
