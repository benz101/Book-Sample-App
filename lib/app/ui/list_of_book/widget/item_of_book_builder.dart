import 'package:book_sample_app/app/model/response/list_of_book_response.dart';
import 'package:book_sample_app/app/ui/detail_of_book/detail_of_book_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemOfBookBuilder extends StatelessWidget {
  final ItemOfBook item;
  const ItemOfBookBuilder({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () => Get.toNamed(DetailOfBookPage.routeName,
            arguments: {'bookId': item.id}),
        child: Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title: ${item.title ?? '-'}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                      (item.authors ?? []).isNotEmpty
                          ? 'Author: ${item.authors!.map((e) => e.name).toList().toString().replaceAll('[', '').replaceAll(']', '')}'
                          : 'Author -',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2)
                ],
              )),
              const SizedBox(
                width: 50,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}