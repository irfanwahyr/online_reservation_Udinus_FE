import 'package:flutter/material.dart';

class FieldTanggal extends StatefulWidget {
  final String judul;
  String tanggalMulai;
  DateTime? tanggalSelesai;

  FieldTanggal({
    Key? key,
    required this.judul,
    required this.tanggalMulai,
    this.tanggalSelesai,
  }) : super(key: key);

  @override
  State<FieldTanggal> createState() => _FieldTanggalState();
}

class _FieldTanggalState extends State<FieldTanggal> {
  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: isStartDate
          ? DateTime.parse(widget.tanggalMulai)
          : widget.tanggalSelesai ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.utc(2040, 3, 14),
    );

    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          widget.tanggalMulai = pickedDate.toString();
        } else {
          widget.tanggalSelesai = pickedDate;
        }
      });
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.tanggalMulai,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.tanggalMulai,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.tanggalSelesai != null
                                ? "${widget.tanggalSelesai!.day.toString().padLeft(2, '0')}-${widget.tanggalSelesai!.month.toString().padLeft(2, '0')}-${widget.tanggalSelesai!.year}"
                                : "Selesai",
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () => _selectDate(context, false),
                            icon: const Icon(
                              Icons.calendar_month_sharp,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.tanggalSelesai != null
                                  ? "${widget.tanggalSelesai!.day.toString().padLeft(2, '0')}-${widget.tanggalSelesai!.month.toString().padLeft(2, '0')}-${widget.tanggalSelesai!.year}"
                                  : "Selesai",
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                            IconButton(
                              onPressed: () => _selectDate(context, false),
                              icon: const Icon(
                                Icons.calendar_month_sharp,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ],
    );
  }
}
