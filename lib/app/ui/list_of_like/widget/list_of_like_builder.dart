import 'package:book_sample_app/app/controller/list_of_like_controller.dart';
import 'package:book_sample_app/app/helper/state_of_obj.dart';
import 'package:book_sample_app/app/model/response/list_of_book_response.dart';
import 'package:book_sample_app/app/ui/list_of_like/widget/item_of_like_builder.dart';
import 'package:flutter/material.dart';

class ListOfLikeBuilder extends StatelessWidget {
  final ListOfLikeController controller;
  final List<ItemOfBook> list;

  const ListOfLikeBuilder(
      {super.key, required this.controller, required this.list});

  @override
  Widget build(BuildContext context) {
    if (controller.state == StateOfObj.IS_LOADING) {
      return const Center(child: CircularProgressIndicator(color: Colors.blueAccent));
    } else if (controller.state == StateOfObj.IS_ERROR) {
      return Center(
          child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              onPressed: () => controller.getListOfLike(),
              child: const Text(
                'Reload',
                style: TextStyle(color: Colors.white),
              )));
    } else if (controller.state == StateOfObj.IS_SUCCESS) {
      if (list.isNotEmpty) {
        return RefreshIndicator(
          onRefresh: () => controller.getListOfLike(),
          child: ListView.builder(
              itemCount: list.length,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) =>
                  ItemOfLikeBuilder(controller: controller, item: list[index])),
        );
      } else {
        return Center(
            child: GestureDetector(
                onTap: () => controller.getListOfLike(),
                child: const Text(
                  'Data is Empty\n(Pleae Tap To Reload)',
                  textAlign: TextAlign.center,
                )));
      }
    }

    return Container();
  }
}