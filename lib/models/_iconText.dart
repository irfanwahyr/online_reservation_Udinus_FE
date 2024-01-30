import 'package:flutter/material.dart';
import 'package:kp2024/models/_heading3.dart';

class IconText extends StatelessWidget {
  final String imageAsset;
  final String text;

  const IconText({
    Key? key, // Use Key? instead of super.key
    required this.imageAsset,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mendapatkan lebar layar
    double screenWidth = MediaQuery.of(context).size.width;
    // Mengatur ukuran gambar berdasarkan lebar layar
    double imageSize = screenWidth > 1200 ? 50.0 : 30.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          imageAsset,
          width: imageSize,
          height: imageSize,
        ),
        const SizedBox(width: 10), // Jarak antara gambar dan teks
        if (screenWidth > 1200)
          Heading3(text: text, color: Colors.white)
        else
          Flexible(child: Heading3(text: text, color: Colors.white)),
      ],
    );
  }
}
