import 'package:flutter/material.dart';
import 'package:kp2024/models/_heading1.dart';

class ContainerLab extends StatefulWidget {
  final String nama;
  final String imageAsset;
  final String deskripsi;

  const ContainerLab({
    Key? key,
    required this.nama,
    required this.imageAsset,
    required this.deskripsi,
  }) : super(key: key);

  @override
  State<ContainerLab> createState() => _ContainerLabState();
}

class _ContainerLabState extends State<ContainerLab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 500,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.imageAsset), // Menggunakan widget.imageAsset
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Heading1(text: widget.nama, color: Colors.white),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                widget.deskripsi,
                style: const TextStyle(fontSize: 12, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ) // Menggunakan widget.nama
          ],
        ),
      ),
    );
  }
}
