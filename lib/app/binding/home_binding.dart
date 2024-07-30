import 'package:book_sample_app/app/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => HomeController());
  }
}
