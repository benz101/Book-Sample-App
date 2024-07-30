import 'package:book_sample_app/app/controller/detail_of_book_controller.dart';
import 'package:flutter/material.dart';
import 'package:book_sample_app/app/model/response/list_of_book_response.dart';


class ItemOfBookBuilder extends StatelessWidget {
  final DetailOfBookController controller;
  final ItemOfBook item;
  const ItemOfBookBuilder(
      {super.key, required this.controller, required this.item});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: IntrinsicHeight(
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  color: (item.formats?.imageJpeg ?? '').isNotEmpty
                      ? Colors.black
                      : Colors.grey,
                  child: (item.formats?.imageJpeg ?? '').isNotEmpty
                      ? Stack(
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Image.network(item.formats!.imageJpeg!)),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  child: controller.likeExist
                                      ? InkWell(
                                          onTap: () => controller
                                              .setDislikeStatus(item.id!),
                                          child: const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () =>
                                              controller.setLikeStatus(item),
                                          child: const Icon(
                                            Icons.favorite_border,
                                            color: Colors.white,
                                          ),
                                        )),
                            )
                          ],
                        )
                      : Container(),
                ),
                const SizedBox(height: 10),
                Text('Title: ${item.title ?? '-'}',
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text((item.authors ?? []).isNotEmpty
                    ? 'Author: ${item.authors!.map((e) => e.name).toList().toString().replaceAll('[', '').replaceAll(']', '')}'
                    : 'Author -'),
                const SizedBox(height: 10),
              ],
            )),
      ),
    );
  }
}