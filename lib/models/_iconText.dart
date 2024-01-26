import 'package:flutter/material.dart';
import 'package:kp2024/models/_heading3.dart';

class IconText extends StatelessWidget {
  final String imageAsset;
  final String text;

  IconText({
    required this.imageAsset,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(imageAsset),
        SizedBox(width: 10,),
        Heading3(text: text, color: Colors.white)
      ],
    );
  }
}
