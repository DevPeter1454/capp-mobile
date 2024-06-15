
import 'package:flutter/material.dart';

class DashDivider extends StatelessWidget {
  final String infoText;

  const DashDivider({Key? key, required this.infoText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(child: Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              infoText,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    ),);
  }

  Expanded buildDivider() {
    return const Expanded(
          child: Divider(
            color: Colors.green,
            height: 1.5,
          ),
        );
  }
}
