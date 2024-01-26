import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Image image;
  final String title;
  final VoidCallback? onTap;


  CustomCard({required this.image, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5.0,
        child: Column(
          children: [
            // Bagian atas card
            Container(
              height: 250, // Sesuaikan dengan kebutuhan
              width: 250, // Sesuaikan dengan kebutuhan
              child: image,
            ),
            // Bagian bawah card
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "Lexand",
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


