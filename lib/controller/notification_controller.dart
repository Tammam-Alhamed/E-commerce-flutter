import 'package:bazar/core/class/statusrequest.dart';
import 'package:bazar/core/functions/handingdatacontroller.dart';
import 'package:bazar/core/services/services.dart';
import 'package:bazar/data/datasource/remote/orders/notification_data.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await notificationData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response ['status'] == "success" ) {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }
  ref(){
    getData();
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}

