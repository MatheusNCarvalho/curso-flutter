import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {
  const FieldTitle({Key key, this.title, this.subtitle}) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3, bottom: 4),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          Text(
            '$title   ',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '$subtitle',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
