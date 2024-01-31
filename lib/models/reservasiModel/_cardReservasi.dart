import 'package:flutter/material.dart';

class CardReservasi {
  final String nama;
  final String imageAsset;
  final VoidCallback? onTap;

  CardReservasi({required this.nama, required this.imageAsset, this.onTap});

  InkWell buildInkwell() {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(
            image: AssetImage(imageAsset),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            nama,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
