import 'package:book_sample_app/app/controller/list_of_book_controller.dart';
import 'package:book_sample_app/app/helper/state_of_obj.dart';
import 'package:book_sample_app/app/helper/state_of_obj_more.dart';
import 'package:book_sample_app/app/model/response/list_of_book_response.dart';
import 'package:book_sample_app/app/ui/detail_of_book/detail_of_book_page.dart';
import 'package:book_sample_app/app/ui/list_of_book/widget/list_of_book_builder.dart';
import 'package:book_sample_app/app/ui/list_of_book/widget/search_form_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListOfBookPage extends StatelessWidget {
  const ListOfBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ListOfBookController(),
        builder: (controller) {
          return Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey[100],
              child: Column(
                children: [
                  SearchFormBuilder(controller: controller),
                  Expanded(
                    child: ListOfBookBuilder(
                        controller: controller, list: controller.listOfBook),
                  ),
                ],
              ));
        });
  }
}






