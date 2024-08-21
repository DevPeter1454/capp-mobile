// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:capp/src/domain/model/civic_education_model.dart';
import 'package:capp/src/presentation/screens/explore/policy_library/pages/view_collection_books.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/domain/model/collection_model.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/civic_book_cardview.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/pages/read_pdf_screen.dart';
import 'package:capp/src/presentation/screens/explore/policy_library/cubit/policy_library_cubit.dart';
import 'package:capp/src/presentation/screens/explore/policy_library/pages/add_new_collection.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';

class PolicyLibraryScreen extends StatefulWidget {
  const PolicyLibraryScreen({super.key});

  @override
  State<PolicyLibraryScreen> createState() => _PolicyLibraryScreenState();
}

class _PolicyLibraryScreenState extends State<PolicyLibraryScreen> {
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

  final ScrollController scrollController = ScrollController();

  final TextEditingController searchController = TextEditingController();
  bool _isSearching = false;

  List<CivicEducationBookModel> _policyList = [];

  void getPolicyByQuery(String query, List<CivicEducationBookModel> policies) {
    _policyList = policies
        .where((policy) =>
            policy.author.toLowerCase().contains(query.toLowerCase()) ||
            policy.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPolicyListAndCollection();
  }

  final _policyLibraryCubit = getIt.get<PolicyLibraryCubit>();
  Future<void> getPolicyListAndCollection() async {
    final response = await _policyLibraryCubit.getPolicyAndCollections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<PolicyLibraryCubit, PolicyLibraryState>(
          bloc: _policyLibraryCubit,
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loading: () {},
              collectionUpdated: (collection) {
                if (collection.id.isNotEmpty) {
                  _policyLibraryCubit.getPolicyAndCollections();
                }
              },
              loadedAll: (policyList, collectionList) {},
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
                loading: () => const Center(
                      child:
                          SpinKitCubeGrid(color: AppColors.primary, size: 50.0),
                    ),
                loadedAll: (policyList, collectionList) {
                  return SizedBox(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomTopNavBar(title: "Back to home"),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/policy.svg',
                                    height: 32.h,
                                    width: 32.w,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    'Policy Library',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.blackTextColor),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                'Your centralized repository for policy documents, regulations and laws.',
                                style: TextStyle(
                                    color: AppColors.descText, fontSize: 14.sp),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              CappCustomFormField(
                                fillColor: const Color(0XFFF4F4F6),
                                prefixIcon: const Icon(
                                  CupertinoIcons.search,
                                  color: Color(0XFF828282),
                                ),
                                controller: searchController,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    // searchController.text = value;
                                    setState(() {
                                      _isSearching = true;
                                    });
                                    getPolicyByQuery(value, policyList);
                                  } else {
                                    setState(() {
                                      _isSearching = false;
                                    });
                                  }
                                },
                                borderColor: Colors.transparent,
                                hintText: "Search by author, title, etc",
                                hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("My Collection",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontSize: 18.sp,
                                                color: AppColors.blackTextColor,
                                                fontWeight: FontWeight.w600)),
                                    InkWell(
                                      onTap: () {
                                        Get.to(
                                          () => const AddNewCollectionScreen(),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/icons/add-circle.svg"),
                                          Text("New Collection",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      fontSize: 14.sp,
                                                      color: AppColors.primary,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                        ],
                                      ),
                                    ),
                                  ]),
                              SizedBox(height: 10.h),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    children: [
                                      if (collectionList.isEmpty) ...[
                                        SvgPicture.asset(
                                            "assets/icons/folder-empty.svg"),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                  "No folder created yet, select ‘New Collection’ to create a collection",
                                                  style: TextStyle(
                                                      color: AppColors.descText,
                                                      fontSize: 14.sp)),
                                            ],
                                          ),
                                        ),
                                      ] else ...[
                                        GridView.builder(
                                          controller: scrollController,
                                          shrinkWrap: true,
                                          physics:
                                              const AlwaysScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 4,
                                            crossAxisSpacing: 0.2,
                                            mainAxisExtent: 200,
                                            childAspectRatio: 0.5,
                                          ),
                                          itemCount: collectionList.isEmpty
                                              ? 0
                                              : collectionList.length,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                Get.to(() =>
                                                    ViewCollectionBooks(
                                                      collection:
                                                          collectionList[index],
                                                      collectionList:
                                                          collectionList,
                                                    ));
                                              },
                                              child: Column(
                                                children: [
                                                  SvgPicture.asset(
                                                    "assets/icons/folder-open.svg",
                                                    height: 130.h,
                                                  ),
                                                  Text(
                                                    collectionList[index]
                                                        .name
                                                        .capitalize!,
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        color: const Color(
                                                            0XFF1E1E1E)),
                                                  ),
                                                  Text(
                                                    "${collectionList[index].books.length} Policies",
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        color:
                                                            AppColors.appGrey),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Policies",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontSize: 18.sp,
                                                  color:
                                                      AppColors.blackTextColor,
                                                  fontWeight: FontWeight.w600)),
                                      InkWell(
                                        onTap: () {
                                          // Get.to(());
                                        },
                                        child: Text("See All",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    fontSize: 14.sp,
                                                    color: AppColors.primary,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  policyList.isEmpty
                                      ? const Center(
                                          child: Text('No items available'),
                                        )
                                      : Flexible(
                                          // height: calculateMainAxisExtent(context.height),
                                          child: ListView.separated(
                                            shrinkWrap: true,
                                            controller: scrollController,
                                            // physics: const NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, int index) {
                                              var e = _isSearching
                                                  ? _policyList[index]
                                                  : policyList[index];
                                              return CivicBooksCardView(
                                                  onMoreClicked: () {
                                                    String selectedValue = '';
                                                    showModalBottomSheet(
                                                      backgroundColor:
                                                          Colors.white,
                                                      context: context,
                                                      builder: (context) {
                                                        return BottomSheetContent(
                                                          bookId: e.id,
                                                          values:
                                                              collectionList,
                                                          selectedValue:
                                                              selectedValue,
                                                          policyLibraryCubit:
                                                              _policyLibraryCubit,
                                                          onSelected: (value) {
                                                            setState(() {
                                                              selectedValue =
                                                                  value;
                                                            });
                                                            // Navigator.pop(context);
                                                          },
                                                        );
                                                      },
                                                    );
                                                  },
                                                  title: e.name,
                                                  imageUrl: e.coverImageUrl,
                                                  time: e.createdAt
                                                      .toIso8601String(),
                                                  numofPages:
                                                      e.pageNumber.toString(),
                                                  author: e.author,
                                                  onClickedRead: () => Get.to(
                                                      () => ReadPdfScreen(
                                                          pdfUrl: e.url)),
                                                  category: e.category);
                                            },
                                            itemCount: _isSearching
                                                ? _policyList.length
                                                : policyList.length,
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return SizedBox(
                                                height: 15.h,
                                              );
                                            },
                                          ),
                                        ),
                                ],
                              ),
                              SizedBox(
                                height: 100.h,
                              ),
                            ]),
                      ),
                    ),
                  );
                },
                orElse: () => const Text("Something went wrong"));
          },
        ),
      ),
    );
  }
}

class BottomSheetContent extends StatefulWidget {
  final List<CollectionModel> values;
  final String selectedValue;
  final ValueChanged<String> onSelected;
  final PolicyLibraryCubit policyLibraryCubit;
  final String bookId;

  const BottomSheetContent({
    Key? key,
    required this.values,
    required this.selectedValue,
    required this.onSelected,
    required this.policyLibraryCubit,
    required this.bookId,
  }) : super(key: key);

  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  late String _selectedValue;
  late String collectionId;
  final ScrollController controller = ScrollController();
  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  Future<void> updatePolicyCollection(
      {required String bookId, required String collectionId}) async {
    if (mounted) Navigator.pop(context);
    final response = await widget.policyLibraryCubit
        .updatePolicyCollection(bookId: bookId, collectionId: collectionId);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // controller: controller,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Add to Collection",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset("assets/icons/close.svg")),
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).hintColor.withOpacity(.6),
          thickness: 0.2,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Text(
              "Add Selected Book to a preferred folder below",
              style: TextStyle(fontSize: 14.sp, color: AppColors.descText),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: controller,
            itemCount: widget.values.length,
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final value = widget.values[index];
              return ListTile(
                title: Text(value.name.capitalize.toString(),
                    style: TextStyle(
                        fontSize: 14.sp, color: const Color(0XFF333333))),
                trailing: Container(
                  width: 24.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _selectedValue == value.id
                          ? AppColors.primary
                          : Colors.white,
                      border: Border.all(
                        color: AppColors.appGrey,
                      )),
                ),
                onTap: () {
                  setState(() {
                    _selectedValue = value.id;
                    // collectionId = value.id
                  });
                  widget.onSelected(value.id);
                },
              );
            },
          ),
        ),
        SizedBox(height: 20.h),
        // const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: CappCustomButton(
              onPress: () {
                if (_selectedValue.isEmpty) {
                  Navigator.pop(context);
                } else {
                  updatePolicyCollection(
                      bookId: widget.bookId, collectionId: _selectedValue);
                }
                // Get.to(() => const FavoritesAddedScreen(), transition: Transition.fade);
              },
              color: AppColors.primary,
              isSolidColor: true,
              paddingVertical: 12,
              isActive: widget.values.isNotEmpty,
              child: const Text(
                'Add to Collection',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              )),
        ),
      ],
    );
  }
}
