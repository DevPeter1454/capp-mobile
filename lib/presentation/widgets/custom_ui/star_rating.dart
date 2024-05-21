
import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback? onRatingChanged;
  final Color? color;
  final double? size;

  const StarRating({super.key, this.starCount = 5, this.rating = .0,
    this.onRatingChanged,
    this.color, this.size});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_outline_sharp,
        color: Color(0xFFE4E4E4).withOpacity(.8),
        size: size,
      );
    }
    else if (index > rating.toInt() - 1 && index < rating) {
      icon = Icon(
        Icons.star_half_sharp,
        color: color ?? Theme.of(context).primaryColor,
        size: size,
      );
    } else {
      icon = Icon(
        Icons.star_sharp,
        color: color ?? Theme.of(context).primaryColor,
        size: size,
      );
    }
    // return  icon;
    return InkResponse(
      onTap: onRatingChanged == null ? null : () {
        if(onRatingChanged!=null) {
          onRatingChanged!(index + 1.0);
        }
      },
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: List.generate(starCount, (index) => buildStar(context, index)));
  }
}
