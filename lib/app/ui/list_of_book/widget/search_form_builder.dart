import 'package:book_sample_app/app/controller/list_of_book_controller.dart';
import 'package:flutter/material.dart';

class SearchFormBuilder extends StatelessWidget {
  final ListOfBookController controller;
  const SearchFormBuilder({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller.keywordCtrl,
        decoration: InputDecoration(
            hintText: 'Enter Keyword',
            border: const OutlineInputBorder(),
            suffixIcon: GestureDetector(
                onTap: () => controller.getListOfBookProcess(),
                child: const Icon(Icons.search))),
        onFieldSubmitted: (v) {
          controller.getListOfBookProcess();
        },
      ),
    );
  }
}