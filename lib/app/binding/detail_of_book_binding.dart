

import 'package:book_sample_app/app/controller/detail_of_book_controller.dart';
import 'package:get/get.dart';

class DetailOfBookBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => DetailOfBookController());
  }
  
}