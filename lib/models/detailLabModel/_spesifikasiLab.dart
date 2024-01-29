import 'package:flutter/material.dart';

class SpesifikasiDetailLab extends StatefulWidget {
  final String namaLab;
  final String jumlahPc;

  const SpesifikasiDetailLab({
    Key? key,
    required this.namaLab,
    required this.jumlahPc,
  }) : super(key: key);

  @override
  State<SpesifikasiDetailLab> createState() => _SpesifikasiDetailLabState();
}

class _SpesifikasiDetailLabState extends State<SpesifikasiDetailLab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                "SPESIFIKASI LAB ${widget.namaLab}",
                style: TextStyle(fontFamily: "Archivo", fontSize: 30),
              ),
              SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(146, 84, 221, 239),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.jumlahPc,
                            style:
                                TextStyle(fontFamily: "Archivo", fontSize: 90),
                          ),
                          Text(
                            "PC",
                            style: TextStyle(fontSize: 40),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(146, 84, 221, 239),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Mic 2\n& \nSpeaker2",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontFamily: "Archivo", fontSize: 40),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(146, 84, 221, 239),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Proyektor",
                            style:
                                TextStyle(fontFamily: "Archivo", fontSize: 40),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
