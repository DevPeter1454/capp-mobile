// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:capp/src/presentation/screens/explore/civic_education/pages/read_pdf_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:capp/src/domain/model/book_model.dart';
import 'package:capp/src/domain/model/civic_education_model.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/civic_book_cardview.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/preview_book.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';

class ViewAllBooksScreen extends StatelessWidget {
  final List<CivicEducationBookModel> loaded;
  const ViewAllBooksScreen({
    Key? key,
    required this.loaded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(children: [
              const CustomTopNavBar(
                title: "All Books",
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: SizedBox(
                  height: context.height,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    itemBuilder: (context, int index) {
                      var e = loaded[index];
                      return CivicBooksCardView(
                          title: e.name,
                          imageUrl: e.coverImageUrl,
                          time: e.createdAt.toIso8601String(),
                          numofPages: e.pageNumber.toString(),
                          author: e.author,
                          onClickedRead: () => Get.to(() => ReadPdfScreen(pdfUrl: e.url)),
                          category: e.category);
                    },
                    separatorBuilder: (context, int index) {
                      return Divider(
                        color: Theme.of(context).hintColor.withOpacity(.6),
                        thickness: 0.2,
                      );
                    },
                    itemCount: loaded.length,
                  ),
                ),
              )
            ])),
      ),
    );
  }
}
