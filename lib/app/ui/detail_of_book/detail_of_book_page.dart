import 'package:book_sample_app/app/controller/detail_of_book_controller.dart';
import 'package:book_sample_app/app/helper/state_of_obj.dart';
import 'package:book_sample_app/app/model/response/list_of_book_response.dart';
import 'package:book_sample_app/app/ui/detail_of_book/widget/detail_of_book_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailOfBookPage extends StatelessWidget {
  static const routeName = '/detail-of-book-page';
  const DetailOfBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back(result: true);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () => Get.back(result: true),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: const Text('Detail Of Book',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blueAccent,
        ),
        body: GetBuilder(
            init: DetailOfBookController(),
            builder: (controller) {
              return DetailOfBookBuilder(controller: controller);
            }),
      ),
    );
  }
}




