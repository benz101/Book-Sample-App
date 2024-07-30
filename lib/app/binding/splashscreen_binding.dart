import 'package:book_sample_app/app/controller/splashscreen_controller.dart';
import 'package:get/get.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => SplashScreenController());
  }
  
}