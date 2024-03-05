import 'package:flutter/material.dart';
import 'package:kp2024/models/_heading7.dart';

class ContainerLab extends StatefulWidget {
  final String jenis_lab;
  final String imageAsset;
  final String deskripsi_lab;

  const ContainerLab({
    Key? key,
    required this.jenis_lab,
    required this.imageAsset,
    required this.deskripsi_lab,
  }) : super(key: key);

  @override
  State<ContainerLab> createState() => _ContainerLabState();
}

class _ContainerLabState extends State<ContainerLab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 400,
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
            Heading7(text: widget.jenis_lab, color: Colors.white),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                widget.deskripsi_lab,
                style: const TextStyle(fontSize: 12, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ) // Menggunakan widget.jenis_lab
          ],
        ),
      ),
    );
  }
}
