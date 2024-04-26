import 'package:flutter/material.dart';

class SpesifikasiDetailLab extends StatefulWidget {
  final String nama_lab;
  final String jumlah_pc;
  final String jenis_lab;
  final List<String> software;
  final List<String> hardware;

  const SpesifikasiDetailLab({
    Key? key,
    required this.nama_lab,
    required this.jumlah_pc,
    required this.jenis_lab,
    required this.software,
    required this.hardware,
  }) : super(key: key);

  @override
  State<SpesifikasiDetailLab> createState() => _SpesifikasiDetailLabState();
}

class _SpesifikasiDetailLabState extends State<SpesifikasiDetailLab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Text(
              "SPESIFIKASI",
              style: const TextStyle(
                  fontFamily: "Archivo", fontSize: 25, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(146, 84, 221, 239),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Ruangan ",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Jumlah PC :",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              SizedBox(width: 10),
                              Text(
                                widget.jumlah_pc,
                                style: TextStyle(fontSize: 15),
                              ),
                              
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Jenis Lab : ",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              SizedBox(width: 10),
                              Text(
                                widget.jenis_lab,
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(146, 84, 221, 239),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Software",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        // Loop untuk membuat widget Text berdasarkan daftar software
                        for (String software in widget.software)
                          Text(
                            software,
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(146, 84, 221, 239),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Hardware",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        // Loop untuk membuat widget Text berdasarkan daftar hardware
                        for (String hardware in widget.hardware)
                          Text(
                            hardware,
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                      ],
                    ),
                  ),
                ],
                  ),
            ),
                ],
              ),
            ),
          );
        }
      }
