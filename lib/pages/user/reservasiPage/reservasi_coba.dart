import 'package:flutter/material.dart';
import 'package:kp2024/models/_heading1.dart';
import 'package:kp2024/models/_heading2.dart';

class ReservasiCoba extends StatefulWidget {
  const ReservasiCoba({Key? key}) : super(key: key);

  @override
  _ReservasiCobaState createState() => _ReservasiCobaState();
}

class _ReservasiCobaState extends State<ReservasiCoba> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Heading2(
                  text: "ReservasiCoba Ruangan Laboratorium A",
                  color: Colors.black,
                ),
              ),
              const Heading1(
                text: "JADWAL LABORATORIUM",
                color: Colors.black,
              ),
              const SizedBox(height: 20),
              // Container untuk slider hari
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _index = (_index - 1).clamp(0, hari.length - 1);
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(136, 33, 149, 243),
                      ),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: hari.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                int newIndex = (_index + index) % hari.length;
                                setState(() {
                                  _index = newIndex;
                                });
                                // Handle navigation or other actions here
                                Navigator.pushNamed(context, '/hari/$newIndex');
                              },
                              child: Container(
                                width: 100,
                                height: 50,
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: index == _index
                                      ? Colors.blue
                                      : Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    hari[index],
                                    style: TextStyle(
                                      color: index == _index
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _index = (_index + 1).clamp(0, hari.length - 1);
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(136, 33, 149, 243),
                      ),
                      child: const Icon(Icons.arrow_forward),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> hari = [
  "Senin",
  "Selasa",
  "Rabu",
  "Kamis",
  "Jumat",
  "Sabtu",
  "Minggu",
  "Senin",
  "Selasa",
  "Rabu",
  "Kamis",
  "Jumat",
  "Sabtu",
  "Minggu",
];
