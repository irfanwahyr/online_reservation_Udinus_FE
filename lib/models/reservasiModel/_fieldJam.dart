  import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

  class FieldJam extends StatefulWidget {
    final String judul;
    final String jam_mulai;
    String? jam_selesai;
    final Function(String) onJamSelesaiSelected;

    FieldJam({
      Key? key,
      required this.judul,
      required this.jam_mulai,
      this.jam_selesai, required this.onJamSelesaiSelected,
    }) : super(key: key);

    @override
    State<FieldJam> createState() => _FieldJamState();
  }

  class _FieldJamState extends State<FieldJam> {
    List<String> waktuDropdown = [];
    List<String> _idList = [];
    List<String> _idPesanList = [];

    @override
    void initState() {
      super.initState();
      loadSharedPreferences();
    }

    void loadSharedPreferences() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? idList = prefs.getStringList('idList');
      List<String>? idPesanList = prefs.getStringList('idPesanList');
      setState(() {
        _idList = idList ?? [];
        _idPesanList = idPesanList ?? [];
      });
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
      _idPesanList = _idPesanList.sublist(indexjam_mulai + 1);
    } else {
      waktuDropdown = List.from(Waktu); // Jika waktu jam_mulai tidak ditemukan, tampilkan semua waktu
    }

    // Menonaktifkan item dropdown sesuai dengan kondisi
    for (int i = 0; i < _idPesanList.length; i++) {
      if ((_idPesanList[i] == '2' || _idPesanList[i] == '3') && i < waktuDropdown.length) {
        waktuDropdown[i] = 'Booked';
      }
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
                                style: const TextStyle(fontSize: 20, color: Colors.white),
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
                                if (value != "Booked") {
                                  widget.onJamSelesaiSelected(value ?? '');
                                  _selectedTime(value ?? '');
                                }
                              },
                              items: waktuDropdown.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  onTap: value == "Booked" ? null : () {
                                    widget.onJamSelesaiSelected(value);
                                    _selectedTime(value);
                                  },
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      color: value == "Booked" ? Colors.grey : Colors.black,
                                    ),
                                  ),
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
                                  style: const TextStyle(fontSize: 20, color: Colors.white),
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
                                if (value != "Booked") {
                                  widget.onJamSelesaiSelected(value ?? '');
                                  _selectedTime(value ?? '');
                                }
                              },
                              items: waktuDropdown.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  onTap: value == "Booked" ? null : () {
                                    widget.onJamSelesaiSelected(value);
                                    _selectedTime(value);
                                  },
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      color: value == "Booked" ? Colors.grey : Colors.black,
                                    ),
                                  ),
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

    Future<void> _selectedTime(String selectedTime) async {
    for (int i = waktuDropdown.indexOf(selectedTime) - 1; i >= 0; i--) {
      if (waktuDropdown[i] == 'Booked') {
        SharedPreferences srf = await SharedPreferences.getInstance();
        srf.setBool('booked', true);
        break;
      }
    }

    // Set jam_selesai sesuai dengan selectedTime
    setState(() {
      widget.jam_selesai = selectedTime;
    });
  }

    List<String> Waktu = [
      "07.50",
      "08.40",
      "09.30",
      "10.20",
      "11.10",
      "12.00",
      "13.20",
      "14.10",
      "15.00",
      "15.50",
      "17.10",
      "18.00",
      "19.20",
      "20.10",
      "21.00",
    ];
  }
