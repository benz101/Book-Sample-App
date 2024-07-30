import 'package:book_sample_app/app/helper/hive_services.dart';
import 'package:book_sample_app/app/helper/state_of_obj.dart';
import 'package:book_sample_app/app/model/response/list_of_book_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ListOfLikeController extends GetxController {
  List<ItemOfBook> listOfBookLocal = [];
  StateOfObj state = StateOfObj.IS_IDLE;
  TextEditingController keywordCtrl = TextEditingController(text: '');

  Future<void> getListOfLike() async {
    try {
      state = StateOfObj.IS_LOADING;
      update();
      await Future.delayed(const Duration(seconds: 1));
      final result = HiveService.taskBox.values.toList();
      debugPrint('result list from local length: ${result.length}');

      listOfBookLocal = keywordCtrl.text.isNotEmpty
          ? result
              .map((e) => ItemOfBook.fromJson(e.toJson()))
              .toList()
              .where((element) =>
                  (element.title ?? '').toLowerCase() ==
                      keywordCtrl.text.toLowerCase() ||
                  (element.authors ?? [])
                      .where((element) =>
                          (element.name ?? '').toLowerCase() ==
                          keywordCtrl.text.toLowerCase())
                      .isNotEmpty)
              .toList()
          : result.map((e) => ItemOfBook.fromJson(e.toJson())).toList();
      state = StateOfObj.IS_SUCCESS;
      update();
    } catch (e) {
      state = StateOfObj.IS_ERROR;
      update();
    }
  }
}
