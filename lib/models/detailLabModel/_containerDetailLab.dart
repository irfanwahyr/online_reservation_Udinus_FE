import 'package:flutter/material.dart';
import 'package:kp2024/models/_buttonPrimary.dart';
class ContainerDetailLab extends StatefulWidget {
  final String laboratorium;
  final String namaLab;
  final String imageAsset;
  final VoidCallback onpressed;

  const ContainerDetailLab({
    Key? key,
    required this.namaLab,
    required this.laboratorium,
    required this.imageAsset,
    required this.onpressed,
  }) : super(key: key);

  @override
  State<ContainerDetailLab> createState() => _ContainerDetailLabState();
}

class _ContainerDetailLabState extends State<ContainerDetailLab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 500,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.imageAsset),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 1200) {
              // Saat lebar lebih dari 900, tata letaknya menjadi kolom
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.laboratorium,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: "Archivo",
                          color: Colors.white,
                          fontSize: 80,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      HoverButtonPrimary(
                        text: "Reservasi",
                        onPressed: widget.onpressed,
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Text(
                    widget.namaLab,
                    style: const TextStyle(
                      color: Color.fromARGB(190, 111, 215, 208),
                      fontFamily: "Archivo",
                      fontSize: 350,
                    ),
                  ),
                ],
              );
            } else {
              // Saat lebar kurang dari atau sama dengan 900
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.laboratorium,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "Archivo",
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                  const SizedBox(height: 10),
                  HoverButtonPrimary(
                    text: "Reservasi",
                    onPressed: widget.onpressed,
                  ),
                  Text(
                    widget.namaLab,
                    style: const TextStyle(
                      color: Color.fromARGB(190, 111, 215, 208),
                      fontFamily: "Archivo",
                      fontSize: 200,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
