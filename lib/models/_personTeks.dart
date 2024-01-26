import 'package:flutter/material.dart';
import 'package:kp2024/models/_heading3.dart';

class PersonTeks extends StatelessWidget {
  final String imageAsset;
  final String nama;
  final String npp;

  const PersonTeks(
      {required this.imageAsset, required this.nama, required this.npp});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440,
      width: 300,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 26, 134, 206),
        borderRadius:
            BorderRadius.circular(10.0), // Ubah nilai sesuai kebutuhan
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
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
          ),
          SizedBox(height: 10),
          Text(
            nama,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Heading3(text: npp, color: Colors.black)
        ],
      ),
    );
  }
}
