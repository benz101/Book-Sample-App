import 'package:book_sample_app/app/helper/hive_services.dart';
import 'package:book_sample_app/app/helper/state_of_obj.dart';
import 'package:book_sample_app/app/model/local/item_of_book_model.dart';
import 'package:book_sample_app/app/model/response/list_of_book_response.dart';
import 'package:book_sample_app/app/service/book_api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailOfBookController extends GetxController {
  int? bookId = Get.arguments['bookId'];
  final bookAPIServices = BookAPIServices();
  StateOfObj state = StateOfObj.IS_IDLE;
  ItemOfBook detailOfBook = ItemOfBook();
  bool likeExist = false;

  @override
  void onInit() async {
    checkLikeStatusExist();
    await getDetailOfBook();
    super.onInit();
  }

  Future<void> getDetailOfBook() async {
    state = StateOfObj.IS_LOADING;
    update();
    final result = await bookAPIServices.getDetailOfBook(bookId ?? 0);
    if (result.id != null) {
      state = StateOfObj.IS_SUCCESS;
      detailOfBook = result;

      update();
    } else {
      state = StateOfObj.IS_ERROR;
      detailOfBook = ItemOfBook();
      update();
    }
  }

  void setLikeStatus(ItemOfBook item) {
    debugPrint('setLikeStatus');
    final newItem = ItemOfBookModel.fromJson(item.toJson());
    HiveService.addBookToHive(newItem);
    likeExist = true;
    update();
  }

  void setDislikeStatus(int bookId) {
    debugPrint('setDislikeStatus');
    int indexResult = HiveService.taskBox.values
        .toList()
        .indexWhere((element) => element.id == bookId);
    HiveService.deleteBookFromHive(indexResult);
    likeExist = false;
    update();
  }

  void checkLikeStatusExist() {
    likeExist = isLikeExist;
    update();
  }

  bool get isLikeExist {
    final result = HiveService.taskBox.values
        .toList()
        .where((element) => element.id == bookId);
    return result.isNotEmpty;
  }
}
