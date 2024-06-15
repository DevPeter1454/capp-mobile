import 'package:flutter/material.dart';

class ExploreByCategoryCard extends StatelessWidget {
  const ExploreByCategoryCard({
    super.key,
    required this.title,
    required this.image,
    required this.ctnColor,
    this.onTap,
  });
  final String title, image;
  final Color ctnColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ctnColor,
            ),
            height: 60,
            width: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 32,
                  width: 32,
                  child: Image.asset(image),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            )),
      ),
    );
  }
}
