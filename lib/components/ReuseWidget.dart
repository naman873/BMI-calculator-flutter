import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant.dart';

class ReuseWidget extends StatelessWidget {
  ReuseWidget({@required this.Iconn, @required this.gender});

  final Icon Iconn;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Iconn,
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: KLabelTextstyle,
        ),
      ],
    );
  }
}
