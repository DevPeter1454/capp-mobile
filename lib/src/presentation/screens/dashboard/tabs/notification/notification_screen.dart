import 'package:capp/src/utils/util.dart';
import 'package:flutter/material.dart';

class NotiificationScreen extends StatelessWidget {
  final bool isClickedOnDashBoard;
  final Function()? onClicked;
  const NotiificationScreen(
      {super.key, this.isClickedOnDashBoard = false, this.onClicked});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: context.heightPercentage(.05),
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        isClickedOnDashBoard
                            ? IconButton(
                                onPressed: onClicked,
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.black,
                                ))
                            : const SizedBox.shrink(),
                        const SizedBox(
                          width: 14,
                        ),
                        const Text("Notification",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
