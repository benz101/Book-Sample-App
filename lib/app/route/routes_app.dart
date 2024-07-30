import 'package:book_sample_app/app/binding/detail_of_book_binding.dart';
import 'package:book_sample_app/app/binding/home_binding.dart';
import 'package:book_sample_app/app/binding/splashscreen_binding.dart';
import 'package:book_sample_app/app/ui/detail_of_book/detail_of_book_page.dart';
import 'package:book_sample_app/app/ui/home_page.dart';
import 'package:book_sample_app/app/ui/splashscreen_page.dart';
import 'package:get/get.dart';

class RoutesApp {
  List<GetPage<dynamic>>? get getPages {
    return [
      GetPage(
          name: SplashScreenPage.routeName,
          page: () => const SplashScreenPage(),
          binding: SplashScreenBinding()),
      GetPage(
          name: HomePage.routeName,
          page: () => const HomePage(),
          binding: HomeBinding()),
      GetPage(
          name: DetailOfBookPage.routeName,
          page: () => const DetailOfBookPage(),
          binding: DetailOfBookBinding()),
    ];
  }
}
