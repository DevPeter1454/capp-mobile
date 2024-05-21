import 'package:flutter/material.dart';


class ProJobMiniButtonWidget extends StatelessWidget {
  const ProJobMiniButtonWidget({
    Key? key,
     this.onBtnTapped, required this.btnTitle,
  }) : super(key: key);

  final Function()? onBtnTapped;
  final String btnTitle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: GestureDetector(
          onTap: onBtnTapped,
          child: Container(
            decoration: BoxDecoration(
                color:  Theme.of(context).highlightColor.withOpacity(.7),
                borderRadius:
                BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Text(
              btnTitle,
              style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
