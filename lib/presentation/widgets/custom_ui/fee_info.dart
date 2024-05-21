

import 'package:flutter/material.dart';
import 'package:capp/presentation/widgets/custom_ui/custom_uis.dart';


class FeeInfoWidget extends StatelessWidget {
  const FeeInfoWidget({
    Key? key, required this.title, required this.desc, this.isLoading = false,
  }) : super(key: key);
  final String title, desc;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/images/v2Imgs/cards/swapfee.png', color: const Color(0xFFCFE9C1), width: 20, height: 20,),
          const SizedBox(width: 10,),
          Text(
            title,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),const SizedBox(width: 5,),
          isLoading ? const SizedLoaderWidget() :
          RichText(
            text: TextSpan(
                style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).highlightColor,
                    fontWeight: FontWeight.w400),
                children:  [TextSpan(
                  text:  desc,
                )]
            ),
          ),
        ],
      ),
    );
  }
}
