import 'package:flutter/material.dart';

class SpesifikasiDetailLab extends StatefulWidget {
  final String nama_lab;
  final String jumlah_pc;

  const SpesifikasiDetailLab({
    Key? key,
    required this.nama_lab,
    required this.jumlah_pc,
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
              style: const TextStyle(fontFamily: "Archivo", fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 350,
                    height: 500,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(146, 84, 221, 239),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Ruangan ",
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                widget.jumlah_pc,
                                style: TextStyle(fontSize: 50),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "PC ",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "2",
                                style: TextStyle(fontSize: 50),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Microphone",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "1",
                                style: TextStyle(fontSize: 50),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Proyektor",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "30",
                                style: TextStyle(fontSize: 50),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Mbps Internet",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "2",
                                style: TextStyle(fontSize: 50),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Speaker",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 350,
                    height: 500,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(146, 84, 221, 239),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Software",
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        // Loop untuk membuat widget Text berdasarkan daftar nama software
                        for (int i = 1; i <= 5; i++)
                          Text(
                            "Software $i",
                            style: TextStyle(fontSize: 50),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 350,
                    height: 500,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(146, 84, 221, 239),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Hardware",
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        // Loop untuk membuat widget Text berdasarkan daftar nama software
                        for (int i = 1; i <= 5; i++)
                          Text(
                            "Hardware $i",
                            style: TextStyle(fontSize: 50),
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
