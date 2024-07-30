import 'package:book_sample_app/app/helper/boxes.dart';
import 'package:book_sample_app/app/model/local/item_of_book_model.dart';
import 'package:hive/hive.dart';


class HiveService {
  static Box<ItemOfBookModel> taskBox = Boxes.getBook();

  static addBookToHive(ItemOfBookModel item) async {
    await taskBox.add(item);
  }

  static updateBookFromHive(int index, ItemOfBookModel task) async {
    await taskBox.putAt(index, task);
  }

  static deleteBookFromHive(int index) async {
    await taskBox.deleteAt(index);
  }
}

