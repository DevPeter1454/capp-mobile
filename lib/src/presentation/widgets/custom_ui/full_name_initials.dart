
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:capp/src/utils/util.dart';


class FullNameInitialsWidget extends StatelessWidget {
  const FullNameInitialsWidget({
    Key? key,
    required this.fullname, required this.color,
  }) : super(key: key);

  final String fullname;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: 85,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
          color: color?? Theme.of(context).highlightColor
      ),
      padding: const EdgeInsets.all(10),
      child: Center(
        child: AutoSizeText(
          Util.getInitials(fullname.toUpperCase()),
          minFontSize: 13,
          maxFontSize: 18,
          maxLines: 1,
          style: const TextStyle(
              fontSize: 17,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w600,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
