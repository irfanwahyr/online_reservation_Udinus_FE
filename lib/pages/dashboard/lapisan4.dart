import 'package:flutter/material.dart';
import 'package:kp2024/models/_heading1.dart';
import 'package:kp2024/models/_personTeks.dart';

class Lapisan4 {
  Container buildContainer() {
    return Container(
      child: const SizedBox(
        width: double.maxFinite,
        height: 550,
        // color: Color.fromARGB(142, 255, 255, 255),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Heading1(text: "PENANGGUNG JAWAB", color: Colors.black),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PersonTeks(
                      imageAsset: "images/anis.png",
                      nama: "Bpk. Anis KA LAB",
                      npp: "NPP 0987637428",
                    ),
                    SizedBox(width: 20),
                    PersonTeks(
                      imageAsset: "images/prabowo.png",
                      nama: "Bpk. Prabowo Admin LAB",
                      npp: "NPP 0987637428",
                    ),
                    SizedBox(width: 20),
                    PersonTeks(
                      imageAsset: "images/ganjar.png",
                      nama: "Bpk. Ganjar Sekertaris LAB",
                      npp: "NPP 0987637428",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
