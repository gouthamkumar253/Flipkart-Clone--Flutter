import 'package:flutter/material.dart';

class RatingInformation extends StatelessWidget {


  Widget _buildRatingBar(ThemeData theme) {
    final List<Widget> stars = <Widget>[];

    for (int i = 1; i <= 4; i++) {
      const Color color =  Colors.blueAccent;
      const Icon star = Icon(
        Icons.star,
        color: color,
      );

      stars.add(star);
    }
    stars.add(const Icon(Icons.star_half,color: Colors.blueAccent,));

    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle ratingCaptionStyle = textTheme.caption.copyWith(color: Colors.black45);

    final Widget numericRating = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '4.5',
          style: textTheme.title.copyWith(
            fontWeight: FontWeight.w400,
            color: theme.accentColor,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          'Ratings',
          style: ratingCaptionStyle,
        ),
      ],
    );

    final Column starRating = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildRatingBar(theme),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 4.0),
          child: Text(
            'Rate this product',
            style: ratingCaptionStyle,
          ),
        ),
      ],
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        numericRating,
        const SizedBox(width: 16.0),
        starRating,
      ],
    );
  }
}