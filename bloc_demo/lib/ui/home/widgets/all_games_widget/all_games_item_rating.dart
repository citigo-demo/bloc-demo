import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AllGameItemRating extends StatelessWidget {
  final double rating;

  AllGameItemRating({required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
        initialRating: rating,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        ignoreGestures: true,
        itemCount: 5,
        itemSize: 16,
        unratedColor: Colors.black45,
        itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
        onRatingUpdate: (rating) {});
  }
}
