import 'package:book_sample_app/app/model/local/item_of_book_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<ItemOfBookModel> getBook() => Hive.box<ItemOfBookModel>("item_of_book");
}