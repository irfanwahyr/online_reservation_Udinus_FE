import 'package:flutter/material.dart';

class ContainerDetailLab extends StatefulWidget {
  final String jenis_lab;
  final String nama_lab;
  final String imageAsset;

  const ContainerDetailLab({
    Key? key,
    required this.nama_lab,
    required this.jenis_lab,
    required this.imageAsset,
  }) : super(key: key);

  @override
  State<ContainerDetailLab> createState() => _ContainerDetailLabState();
}

class _ContainerDetailLabState extends State<ContainerDetailLab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: AssetImage(widget.imageAsset),
          
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 1200) {
              // Saat lebar lebih dari 1200, tata letaknya menjadi row
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          widget.jenis_lab,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: "Archivo",
                            color: Colors.white,
                            fontSize: 50,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.nama_lab,
                    style: const TextStyle(
                      color: Color.fromARGB(190, 111, 215, 208),
                      fontFamily: "Archivo",
                      fontSize: 100,
                    ),
                  ),
                ],
              );
            } else {
              // Saat lebar kurang dari atau sama dengan 1200
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      widget.jenis_lab,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: "Archivo",
                        color: Colors.white,
                        fontSize: 50,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.nama_lab,
                    style: const TextStyle(
                      color: Color.fromARGB(190, 111, 215, 208),
                      fontFamily: "Archivo",
                      fontSize: 100,
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
