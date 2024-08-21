import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/domain/model/mda.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/read_all_info_screen.dart';
import 'package:capp/src/presentation/screens/explore/know_your_mda/cubit/know_your_mda_cubit.dart';
import 'package:capp/src/presentation/screens/explore/know_your_mda/pages/lodge_complaint/lodge_complaint_screen.dart';
import 'package:capp/src/presentation/widgets/custom_ui/continue_reading.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MdaDetailsScreen extends StatefulWidget {
  final Mda mda;
  const MdaDetailsScreen({super.key, required this.mda});

  @override
  State<MdaDetailsScreen> createState() => _MdaDetailsScreenState();
}

class _MdaDetailsScreenState extends State<MdaDetailsScreen> {
  get calculateMaxLines {
    if (context.height <= 667) {
      return 10;
    } else if (context.height <= 746) {
      return 12;
    } else if (context.height <= 896) {
      return 15;
    } else {
      // Default case for heights greater than 844
      return 18;
    }
  }

  double calculateMainAxisExtent(double availableHeight) {
    if (context.height <= 667) {
      return availableHeight - 205;
    } else if (context.height <= 746) {
      return availableHeight - 152;
    } else if (context.height <= 896) {
      return availableHeight - 88;
    } else if (context.height <= 915) {
      return availableHeight - 17;
    } else {
      // Default case for heights greater than 844
      return availableHeight;
    }
  }

  final _knowYourMdaCubit = getIt.get<KnowYourMdaCubit>();
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    getMdaDetails(widget.mda.id);
    // _knowYourMdaCubit.getMdaDetails(widget.mda.id);
  }

  Future<void> getMdaDetails(String id) async {
    await _knowYourMdaCubit.getMdaById(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<KnowYourMdaCubit, KnowYourMdaState>(
        bloc: _knowYourMdaCubit,
        listener: (context, state) {
          state.maybeWhen(
              loading: () {
                context.showLoadingDialog();
              },
              error: (message) {
                context.hideLoadingDialog();
                context.showSnackBar(message);
              },
              mdaLoaded: (mda) {
                // print("mda loaded ${mda.complains![0].firstName}");
              },
              orElse: () {});
        },
        builder: (context, state) {
          return state.maybeWhen(
              loading: () => const Center(
                    child:
                        SpinKitCubeGrid(color: AppColors.primary, size: 50.0),
                  ),
              mdaLoaded: (mda) {
                return SingleChildScrollView(
                  controller: controller,
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 20.5.h),
                            CustomTopNavBar(title: widget.mda.ministryName),
                            SizedBox(height: 31.5.h),
                            Image.network(
                              mda.ministryLogo,
                              height: 247.h,
                              width: double.infinity,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                            Flexible(
                                child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                widget.mda.ministryName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ),
                            )),
                            const Divider(
                              color: AppColors.descText,
                              thickness: 0.5,
                            ),
                            SizedBox(height: 20.h),
                            CappCustomButton(
                              color: AppColors.primary.withOpacity(.1),
                              isSolidColor: true,
                              isActive: true,
                              onPress: () {
                                Get.to(() => LodgeComplaintScreen(
                                      mdaId: mda.id,
                                    ));
                              },
                              child: Text(
                                "Lodge a Complaint",
                                style: TextStyle(
                                    fontSize: 16.sp, color: AppColors.primary),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            SizedBox(
                              height: calculateMainAxisExtent(450),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: ContinueReading(
                                  content: widget.mda.ministryDescription ?? '',
                                  maxline: calculateMaxLines,
                                  onClickedContinueReading: () => Get.to(() =>
                                      ReadAllInfoScreen(
                                          title: widget.mda.ministryName,
                                          content:
                                              widget.mda.ministryDescription)),
                                ),
                              ),
                            ),
                            SizedBox(height: 30.h),
                            Text(
                              "Minister",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
                            ),
                            Container(
                              height: 225.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Column(children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8.r),
                                        topRight: Radius.circular(8.r)),
                                    child: Image.network(
                                      widget.mda.ministryImage,
                                      height: 185.h,
                                      fit: BoxFit.contain,
                                      width: double.infinity,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                      },
                                    )),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        widget.mda.ministerName,
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                            ),
                            SizedBox(height: 25.h),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Complains",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 16.sp,
                                              color: AppColors.blackTextColor,
                                              fontWeight: FontWeight.w600)),
                                  InkWell(
                                    onTap: () {},
                                    child: Text("See all",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontSize: 12.sp,
                                                color: AppColors.primary,
                                                fontWeight: FontWeight.w600)),
                                  ),
                                ]),
                            SizedBox(height: 25.h),
                            mda.complains!.isEmpty
                                ? const SizedBox.shrink()
                                : ListView.separated(
                                    itemCount: mda.complains!.length,
                                    shrinkWrap: true,
                                    controller: controller,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(height: 12.h);
                                    },
                                    itemBuilder: (context, index) {
                                      return ComplaintWidget(
                                          name: mda.complains![index].firstName,
                                          createdAt:
                                              mda.complains![index].createdAt,
                                          complain:
                                              mda.complains![index].complain);
                                    },
                                  ),
                            SizedBox(height: 25.h),
                          ]),
                    ),
                  ),
                );
              },
              orElse: () => const Text("Something went wrong"));
        },
      ),
    );
  }
}

class ComplaintWidget extends StatelessWidget {
  final String name;
  final String createdAt;
  final String complain;
  const ComplaintWidget({
    super.key,
    required this.name,
    required this.createdAt,
    required this.complain,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 152.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.appGrey),
            borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            Text(
              // mda.complains![0].complain,
              complain,
              style: TextStyle(fontSize: 14.sp, color: AppColors.descText),
            ),
            SizedBox(height: 12.h),
            Text(
              // "by ${mda.complains![0].firstName} ${mda.complains![0].firstName}  ${DateFormat('dd/MM/yyyy').format(DateTime.parse(mda.complains![0].createdAt))}",
              "by $name ${DateFormat('dd/MM/yyyy').format(DateTime.parse(createdAt))}",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.descText),
            )
          ],
        ));
  }
}
