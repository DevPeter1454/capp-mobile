import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const LoadingOverlay({
    Key? key,
    required this.child,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        onWillPop: ()async{
            Get.back();
            return Future.delayed(Duration(milliseconds: 100));
        },
      child: Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: Colors.black26,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(8)
                ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 30,
                          width: 30,
                          child: CircularProgressIndicator()),
                      SizedBox(width: 10,),
                      Text('Loading',
                      style: TextStyle(fontSize: 15,
                      fontWeight: FontWeight.w500),)
                    ],
                  )),
            ),
          ),
      ],
    ));
  }
}