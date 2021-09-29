import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          IconButton(
              icon: Icon(FontAwesomeIcons.chevronCircleLeft), onPressed: () {}),
          Spacer(),
          IconButton(icon: Icon(FontAwesomeIcons.commentAlt), onPressed: () {}),
          SizedBox(
            width: 5,
          ),
          IconButton(
              icon: Icon(FontAwesomeIcons.accessibleIcon), onPressed: () {}),
          SizedBox(width: 5),
        ],
      ),
    );
  }
}
