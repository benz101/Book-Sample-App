import 'package:book_sample_app/app/controller/list_of_book_controller.dart';
import 'package:book_sample_app/app/controller/list_of_like_controller.dart';
import 'package:book_sample_app/app/ui/list_of_book/list_of_book_page.dart';
import 'package:book_sample_app/app/ui/list_of_like/list_of_like_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final listOfBookController = Get.put(ListOfBookController());
  final listOfLikeController = Get.put(ListOfLikeController());
  int currentIndex = 0;
  List<Widget> listOfPage = [const ListOfBookPage(), const ListOfLikePage()];
  List<BottomNavigationBarItem> listOfMenu = [
    const BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Book'),
    const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Like')
  ];

  void setCurrentIndex(int index) {
    currentIndex = index;
    update();
    if (index == 1) {
      listOfLikeController.getListOfLike();
    }
  }
}
