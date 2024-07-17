import 'package:capp/src/domain/model/leader_profile.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewAllocationScreen extends StatefulWidget {
  final LeaderProfile leader;
  const ViewAllocationScreen({super.key, required this.leader});

  @override
  State<ViewAllocationScreen> createState() => _ViewAllocationScreenState();
}

class _ViewAllocationScreenState extends State<ViewAllocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(height: 12.h),
            const CustomTopNavBar(title: "Allocation"),
            SizedBox(height: 12.h),
            Text(
                "Below are the breakdown of various allocated funds to specific projects",
                style: TextStyle(
                  fontSize: 14.sp,
                )),
            SizedBox(height: 12.h),
            Text(widget.leader.allocation,
                style: TextStyle(
                  fontSize: 14.sp,
                )),
          ],
        ),
      ),
    );
  }
}
