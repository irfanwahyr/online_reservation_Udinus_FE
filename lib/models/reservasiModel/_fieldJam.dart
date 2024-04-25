import 'package:flutter/material.dart';

class FieldJam extends StatefulWidget {
  final String judul;
  final String jam_mulai;
  String? jam_selesai;
  final Function(String) onJamSelesaiSelected;

  FieldJam({
    Key? key,
    required this.judul,
    required this.jam_mulai,
    this.jam_selesai,
    required this.onJamSelesaiSelected,
  }) : super(key: key);

  @override
  State<FieldJam> createState() => _FieldJamState();
}

class _FieldJamState extends State<FieldJam> {
  List<String> waktuDropdown = [];

  @override
  void initState() {
    super.initState();
    _generateDropdownItems();
  }

  @override
  void didUpdateWidget(FieldJam oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.jam_mulai != widget.jam_mulai) {
      _generateDropdownItems();
    }
  }

  void _generateDropdownItems() {
    int indexjam_mulai = Waktu.indexOf(widget.jam_mulai);
    if (indexjam_mulai != -1) {
      waktuDropdown = Waktu.sublist(indexjam_mulai + 1);
    } else {
      waktuDropdown = List.from(
          Waktu); // Jika waktu jam_mulai tidak ditemukan, tampilkan semua waktu
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.judul,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MediaQuery.of(context).size.width >= 440
                ? Container(
                    width: 195,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        widget.jam_mulai,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                : Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          widget.jam_mulai,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
            const SizedBox(width: 10),
            MediaQuery.of(context).size.width >= 440
                ? Container(
                    width: 195,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Center(
                            child: Text(
                              widget.jam_selesai ?? '',
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: DropdownButton<String>(
                            icon: const Icon(
                              Icons.arrow_drop_down_circle_outlined,
                              color: Colors.white,
                            ),
                            elevation: 10,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: const Color.fromARGB(0, 255, 255, 255),
                            ),
                            onChanged: (String? value) {
                              widget.onJamSelesaiSelected(value ?? '');
                              _selectedTime(value ?? '');
                            },
                            items: waktuDropdown
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Center(
                              child: Text(
                                widget.jam_selesai ?? '',
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: DropdownButton<String>(
                              icon: const Icon(
                                Icons.arrow_drop_down_circle_outlined,
                                color: Colors.white,
                              ),
                              elevation: 10,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: const Color.fromARGB(0, 255, 255, 255),
                              ),
                              onChanged: (String? value) {
                                widget.onJamSelesaiSelected(value ?? '');
                                _selectedTime(value ?? '');
                              },
                              items: waktuDropdown
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ],
    );
  }

  void _selectedTime(String selectedTime) {
    setState(() {
      widget.jam_selesai = selectedTime;
    });
    // Navigator.pop(context);
  }

  List<String> Waktu = [
    "07.00",
    "07.50",
    "08.40",
    "09.30",
    "10.20",
    "11.10",
    "12.00",
    "12.30",
    "13.20",
    "14.10",
    "15.00",
    "15.30",
    "16.20",
    "17.10",
    "18.00",
    "18.30",
    "19.20",
    "20.10",
    "21.00",
  ];
}
