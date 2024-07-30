import 'package:book_sample_app/app/controller/detail_of_book_controller.dart';
import 'package:book_sample_app/app/helper/state_of_obj.dart';
import 'package:book_sample_app/app/ui/detail_of_book/widget/item_of_book_builder.dart';
import 'package:flutter/material.dart';

class DetailOfBookBuilder extends StatelessWidget {
  final DetailOfBookController controller;
  const DetailOfBookBuilder({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[300],
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Builder(builder: (context) {
          if (controller.state == StateOfObj.IS_LOADING) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.blueAccent));
          }
          if (controller.state == StateOfObj.IS_SUCCESS) {
            return ItemOfBookBuilder(
                controller: controller, item: controller.detailOfBook);
          }
          if (controller.state == StateOfObj.IS_ERROR) {
            return Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent),
                    onPressed: () => controller.getDetailOfBook(),
                    child: const Text(
                      'Reload',
                      style: TextStyle(color: Colors.white),
                    )));
          }
          return Container();
        }));
  }
}