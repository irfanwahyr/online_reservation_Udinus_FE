import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imageAsset;
  const CustomImage({super.key, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(10.0), // Ubah nilai sesuai kebutuhan
        image: DecorationImage(
          image: AssetImage(
              imageAsset), // Ganti path dengan path sesuai gambar Anda
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
