class AppLink {


  static const String server = "http://tammam-com.preview-domain.com/Bazar";
  static const String imageststatic = "https://xn----7sbababd9be0gf.com/Bazar_laravel/Bazar";
//========================== Image ============================
  static const String imagestCategories = "$imageststatic/categories";
  static const String imagestShopes = "$imageststatic/shopes";
  static const String imagestItems = "$imageststatic/items";
  static const String imagestSlides = "$imageststatic/slides";
// =============================================================
//

  static const String notification = "$server/notification.php";

// ================================= Auth ========================== //

  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifycodessignup = "$server/auth/verfiycode.php";
  static const String resend = "$server/auth/resend.php";

// ================================= ForgetPassword ========================== //

  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword = "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword = "$server/forgetpassword/verifycode.php";

// Home

  static const String homepage = "$server/home.php";
// items
  static const String items = "$server/items/items.php";
  static const String itemsImages = "$server/items/images.php";
  static const String searchitems = "$server/items/search.php";
  static const String itemsdiscount = "$server/items/itemsDiscount.php";
  static const String itemsnew = "$server/items/itemsNew.php";
  static const String itemsoffer = "$server/items/itemsOffer.php";


  //sort
  static const String A_to_Z = "$server/sort/A_to_Z.php";
  static const String Z_to_A = "$server/sort/Z_to_A.php";
  static const String Lowest_to_Highest = "$server/sort/price_lowest.php";
  static const String Highest_to_Lowest = "$server/sort/price_highest.php";


 //Checkout

  static const String categories = "$server/categories/view.php";

// Favorite

  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deletefromfavroite =
      "$server/favorite/deletefromfavroite.php";

  // Cart
  static const String cartview = "$server/cart/view.php";
  static const String cartadd = "$server/cart/add.php";
  static const String cartdelete = "$server/cart/delete.php";
  static const String cartgetcountitems = "$server/cart/getcountitems.php";
  static const String fromcartadd = "$server/cart/fromcartadd.php";
  static const String fromcartdelete = "$server/cart/fromcartdelete.php";

  // Address

  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressDelete = "$server/address/delete.php";

  // Coupon 

  static const String checkcoupon  = "$server/coupon/checkcoupon.php";
  
  // Checkout 

  static const String checkout  = "$server/orders/checkout.php";
  
  static const String pendingorders  = "$server/orders/pending.php";
  static const String ordersarchive  = "$server/orders/archive.php";
  static const String ordersdetails  = "$server/orders/details.php";
  static const String ordersdelete  = "$server/orders/delete.php";

// slides
}
