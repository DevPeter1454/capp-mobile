import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,  this.title, this.endWidget, this.onBackPressed, this.padding,
  });
  final String? title;
  final Widget? endWidget;
  final Function()? onBackPressed;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:padding ??  const EdgeInsets.only(bottom: 20, top: 10, left: 10, right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          onBackPressed !=null ? IconButton(
            icon:
            const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: onBackPressed,
          ) : const SizedBox(width: 50,),
          Text(
            title ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          endWidget ?? const SizedBox(width: 60,)
        ],
      ),
    );
  }
}