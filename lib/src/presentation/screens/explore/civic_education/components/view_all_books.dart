import 'package:capp/src/domain/model/book_model.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/civic_book_cardview.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/preview_book.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAllBooksScreen extends StatelessWidget {
  const ViewAllBooksScreen({super.key});

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
                      var e = civicBooksList[index];
                      return CivicBooksCardView(
                          title: e.title,
                          imageUrl: e.imageUrl,
                          time: e.time,
                          onClickedRead: () =>
                              Get.to(() => PreviewBookScreen(bookModel: e)),
                          numofPages: e.numOfPages.toString(),
                          author: e.author,
                          category: e.category);
                    },
                    separatorBuilder: (context, int index) {
                      return Divider(
                        color: Theme.of(context).hintColor.withOpacity(.6),
                        thickness: 0.2,
                      );
                    },
                    itemCount: civicBooksList.length,
                  ),
                ),
              )
            ])),
      ),
    );
  }
}
