import 'package:flutter/material.dart';

class ArtisanCategoriesItemWidget extends StatelessWidget {
  const ArtisanCategoriesItemWidget({
    super.key, required this.title, required this.image, this.onTap,
  });
  final String title, image;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomLeft: Radius.circular(20),),
        child: Container(
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomLeft: Radius.circular(20),),
            color: Theme.of(context).indicatorColor,
          ),
          height: 130,
          width: 130,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 1,
                right: -20,
                child: Image.asset(image,
                  width: 120,
                  height: 100,
                  fit: BoxFit.fill,),
              )
            ],
          ),
        ),
      ),
    );
  }
}