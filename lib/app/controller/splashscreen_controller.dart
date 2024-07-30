import 'package:book_sample_app/app/ui/home_page.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(
        const Duration(seconds: 3), () => Get.offAllNamed(HomePage.routeName));
    super.onInit();
  }
}
