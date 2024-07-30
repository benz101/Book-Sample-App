import 'package:book_sample_app/app/controller/list_of_book_controller.dart';
import 'package:book_sample_app/app/helper/state_of_obj.dart';
import 'package:book_sample_app/app/helper/state_of_obj_more.dart';
import 'package:book_sample_app/app/model/response/list_of_book_response.dart';
import 'package:book_sample_app/app/ui/list_of_book/widget/item_of_book_builder.dart';
import 'package:flutter/material.dart';

class ListOfBookBuilder extends StatelessWidget {
  final ListOfBookController controller;
  final List<ItemOfBook> list;

  const ListOfBookBuilder(
      {super.key, required this.controller, required this.list});

  @override
  Widget build(BuildContext context) {
    if (controller.state == StateOfObj.IS_LOADING) {
      return const Center(
          child: CircularProgressIndicator(color: Colors.blueAccent));
    } else if (controller.state == StateOfObj.IS_ERROR) {
      return Center(
          child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              onPressed: () => controller.getListOfBookProcess(),
              child: const Text(
                'Reload',
                style: TextStyle(color: Colors.white),
              )));
    } else if (controller.state == StateOfObj.IS_SUCCESS) {
      if (list.isNotEmpty) {
        return RefreshIndicator(
          onRefresh: () => controller.getListOfBookProcess(),
          child: ListView.builder(
              controller: controller.scrollController,
              itemCount: list.length + 1,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) => list.isEmpty
                  ? Container()
                  : list.length != index
                      ? ItemOfBookBuilder(item: list[index])
                      : controller.stateMore == StateOfObjMore.IS_LOADING_MORE
                          ? Container(
                              width: double.infinity,
                              height: 80,
                              color: Colors.transparent,
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            )
                          : Container()),
        );
      } else {
        return Center(
            child: GestureDetector(
                onTap: () => controller.getListOfBookProcess(),
                child: const Text(
                  'Data is Empty\n(Pleae Tap To Reload)',
                  textAlign: TextAlign.center,
                )));
      }
    }

    return Container();
  }
}