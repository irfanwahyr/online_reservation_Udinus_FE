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
      padding: const EdgeInsets.all(15),
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
              const SizedBox(height: 40),
              Text(
                "SPESIFIKASI LAB ${widget.namaLab}",
                style: const TextStyle(fontFamily: "Archivo", fontSize: 30),
              ),
              const SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(146, 84, 221, 239),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.jumlahPc,
                            style:
                                const TextStyle(fontFamily: "Archivo", fontSize: 90),
                          ),
                          const Text(
                            "PC",
                            style: TextStyle(fontSize: 40),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(146, 84, 221, 239),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Column(
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
                    const SizedBox(width: 20),
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(146, 84, 221, 239),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Column(
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
                    const SizedBox(width: 20),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
