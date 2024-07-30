import 'package:book_sample_app/app/helper/state_of_obj.dart';
import 'package:book_sample_app/app/helper/state_of_obj_more.dart';
import 'package:book_sample_app/app/model/response/list_of_book_response.dart';
import 'package:book_sample_app/app/service/book_api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ListOfBookController extends GetxController {
  final bookAPIServices = BookAPIServices();
  StateOfObj state = StateOfObj.IS_IDLE;
  StateOfObjMore stateMore = StateOfObjMore.IS_IDLE_MORE;
  List<ItemOfBook> listOfBook = [];
  final scrollController = ScrollController();
  bool isStopIncPage = false;
  int currentPage = 1;

  TextEditingController keywordCtrl = TextEditingController();

  @override
  void onInit() async{
    await getListOfBookProcess();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
              scrollController.position.pixels &&
          scrollController.position.atEdge) {
            getListMoreOfBookProcess();
          }
    });
    super.onInit();
  }

  Future<void> getListOfBookProcess() async {
    debugPrint('keywordCtrl.text: ${keywordCtrl.text}');
    currentPage = 1;
    state = StateOfObj.IS_LOADING;
    update();
    final result = await bookAPIServices.getListOfBook(currentPage, keyword: keywordCtrl.text);
    if (result.results != null) {
      state = StateOfObj.IS_SUCCESS;
      listOfBook = result.results!;
      update();
    } else {
      state = StateOfObj.IS_ERROR;
      listOfBook = [];
      update();
    }
  }

  Future<void> getListMoreOfBookProcess() async {
    !isStopIncPage ? currentPage = currentPage + 1 : null;
    stateMore = StateOfObjMore.IS_LOADING_MORE;
    update();
    final result = await bookAPIServices.getListOfBook(currentPage);
    if (result.results != null) {
      stateMore = StateOfObjMore.IS_SUCCESS_MORE;
      if (!isStopIncPage) {
        result.results!.isNotEmpty
            ? listOfBook.addAll(result.results!)
            : listOfBook.addAll([]);
        update();
      } else {
        isStopIncPage = true;
      }
    } else {
      isStopIncPage = true;
      stateMore = StateOfObjMore.IS_ERROR_MORE;
      update();
    }
  }
}
