import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/presentation/screens/explore/know_your_leaders/pages/rate_leader/successful_rating_screen.dart';
import 'package:capp/src/presentation/screens/explore/policy_library/pages/cubit/add_new_collection_cubit.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as tr;


class AddNewCollectionScreen extends StatefulWidget {
  const AddNewCollectionScreen({super.key});

  @override
  State<AddNewCollectionScreen> createState() => _AddNewCollectionScreenState();
}

class _AddNewCollectionScreenState extends State<AddNewCollectionScreen> {
  final _addNewCollectionCubit = getIt.get<AddNewCollectionCubit>();
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // testCreateCollection();
  }

  Future testCreateCollection({required String name}) async {
    if (controller.text.isEmpty) {
      Get.snackbar("Error", "Please enter a collection name", backgroundColor: Colors.redAccent.withOpacity(0.3));
      return;
    }
    final response = await _addNewCollectionCubit.createPolicyCollection(name: name);
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AddNewCollectionCubit, AddNewCollectionState>(
          bloc: _addNewCollectionCubit,
          listener: (context, state) {
            state.maybeWhen(loaded: (response) {
              if (response.id.isNotEmpty) {
                 Get.off(() => const SuccessfulRatingScreen(text: "You have successfully created a collection"),
                    transition: tr.Transition.fade);
              } else {
                Get.snackbar("Error", "An error occurred while rating leader");
              }
            }, orElse: () {
              print("error");
            });
          },
          builder: (context, state) {
            return state.maybeWhen(
              error: (error) => Text("error $error"),
              loading: () => const Center(
                child: SpinKitCubeGrid(color: AppColors.primary, size: 50.0),
              ),
              orElse: () {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTopNavBar(title: "Add new collection"),
                        Text(
                          "Please enter name of new Collection below",
                          style: TextStyle(fontSize: 14.sp, color: AppColors.descText),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          "Collection Name",
                          style: TextStyle(fontSize: 12.sp, fontFamily: "Poppins", fontWeight: FontWeight.w500, color: AppColors.blackTextColor),
                        ),
                        SizedBox(height: 12.h),
                        CappCustomFormField(
                            maxLines: 1,
                            controller: controller,
                            hintText: "Enter collection name",
                            fillColor: const Color(0XFFF4F4F6),
                            borderColor: Colors.transparent),
                        SizedBox(height: 300.h),
                        CappCustomButton(
                          onPress: () {
                            testCreateCollection(name: controller.text);
                            // Get.off(() => const SuccessfulRatingScreen(),
                            //     transition: Transition.fade);
                          },
                          isActive: true,
                          color: AppColors.primary,
                          isSolidColor: true,
                          width: double.infinity,
                          child: Text("Submit", style: TextStyle(fontSize: 16.sp, color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
