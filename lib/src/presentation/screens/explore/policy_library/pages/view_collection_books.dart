import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/domain/model/civic_education_model.dart';
import 'package:capp/src/domain/model/collection_model.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/civic_book_cardview.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/pages/read_pdf_screen.dart';
import 'package:capp/src/presentation/screens/explore/policy_library/cubit/policy_library_cubit.dart';
import 'package:capp/src/presentation/screens/explore/policy_library/policy_library_screen.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ViewCollectionBooks extends StatefulWidget {
  final CollectionModel collection;
  final List<CollectionModel> collectionList;
  const ViewCollectionBooks({super.key, required this.collection, required this.collectionList});

  @override
  State<ViewCollectionBooks> createState() => _ViewCollectionBooksState();
}

class _ViewCollectionBooksState extends State<ViewCollectionBooks> {
  String bookType() {
    if (widget.collection.books.length == 1) {
      return 'Book';
    } else {
      return 'Books';
    }
  }

  double calculateMainAxisExtent(double availableHeight) {
    if (context.height <= 667) {
      return availableHeight / context.heightPercentage(0.0065);
    } else if (context.height <= 746) {
      return availableHeight / context.heightPercentage(0.0053);
    } else if (context.height <= 783) {
      return availableHeight / context.heightPercentage(0.0051);
    } else if (context.height <= 812) {
      return availableHeight / context.heightPercentage(0.0050);
    } else if (context.height <= 844) {
      return availableHeight / context.heightPercentage(0.0042);
    } else {
      // Default case for heights greater than 844
      return availableHeight / context.heightPercentage(0.0042);
    }
  }

  final _policyLibraryCubit = getIt.get<PolicyLibraryCubit>();

  @override
  void initState() {
    super.initState();
    print(widget.collection.books);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 15.h),
            CustomTopNavBar(
                title:
                    "${widget.collection.name.capitalize} (${widget.collection.books.isEmpty ? 'Empty' : '${widget.collection.books.length} ${bookType()} '})"),
            SizedBox(
              height: 15.h,
            ),
            widget.collection.books.isEmpty
                ? const Center(
                    child: Text('No items available'),
                  )
                : SizedBox(
              height: calculateMainAxisExtent(context.height),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, int index) {
                  // final policyList = widget.collection.books;
                  var e = CivicEducationBookModel.fromMap(widget.collection.books[index]);
                  return CivicBooksCardView(
                      onMoreClicked: () {
                        // String selectedValue = '';
                        // showModalBottomSheet(
                        //   backgroundColor: Colors.white,
                        //   context: context,
                        //   builder: (context) {
                        //     return BottomSheetContent(
                        //       bookId: e.id,
                        //       values: widget.collectionList,
                        //       selectedValue: selectedValue,
                        //       policyLibraryCubit: _policyLibraryCubit,
                        //       onSelected: (value) {
                        //         setState(() {
                        //           selectedValue = value;
                        //         });
                        //         // Navigator.pop(context);
                        //       },
                        //     );
                        //   },
                        // );
                      },
                      title: e.name,
                      imageUrl: e.coverImageUrl,
                      time: e.createdAt.toIso8601String(),
                      numofPages: e.pageNumber.toString(),
                      author: e.author,
                      onClickedRead: () => Get.to(() => ReadPdfScreen(pdfUrl: e.url)),
                      category: e.category);
                },
                itemCount: widget.collection.books.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 15.h,
                  );
                },
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      ),
    );
  }
}
