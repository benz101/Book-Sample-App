import 'package:book_sample_app/app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Book App', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.blueAccent,
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.transparent,
              child: controller.listOfPage[controller.currentIndex],
            ),
            bottomNavigationBar: BottomNavigationBar(
               backgroundColor: Colors.blueAccent,
               selectedItemColor: Colors.redAccent,
               unselectedItemColor: Colors.white,
               selectedLabelStyle: const TextStyle(color: Colors.white),
               unselectedLabelStyle: const TextStyle(color: Colors.white),
              items: controller.listOfMenu,
              currentIndex: controller.currentIndex,
              onTap: (i) => controller.setCurrentIndex(i),
            ),
          );
        });
  }
}
