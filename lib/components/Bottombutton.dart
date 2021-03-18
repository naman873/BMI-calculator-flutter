import 'package:flutter/material.dart';
import '../constant.dart';

class BottomButton extends StatelessWidget {

  BottomButton({@required this.buttontitle,@required this.onTap});

  final String buttontitle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(buttontitle,style: KLargeButtonTextStyle),
        ),
        color: KBottomContainercolor,
        margin: EdgeInsets.only(top: 10.0),
        height: KBottomContainerheight,
        width: double.infinity,
        //padding: EdgeInsets.only(bottom: 20.0),
      ),
    );
  }
}