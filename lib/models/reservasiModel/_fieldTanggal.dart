import 'package:flutter/material.dart';

class FieldTanggal extends StatefulWidget {
  final String judul;
  DateTime tanggalMulai;
  DateTime? tanggalSelesai;

  FieldTanggal({
    super.key,
    required this.judul,
    required this.tanggalMulai,
    this.tanggalSelesai,
  });

  @override
  State<FieldTanggal> createState() => _FieldTanggalState();
}

class _FieldTanggalState extends State<FieldTanggal> {
  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: isStartDate
          ? widget.tanggalMulai
          : widget.tanggalSelesai ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.utc(2040, 3, 14),
    );

    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          widget.tanggalMulai = pickedDate;
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
            Container(
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
                      "${widget.tanggalMulai.day}-${widget.tanggalMulai.month}-${widget.tanggalMulai.year}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    IconButton(
                      onPressed: () => _selectDate(context, true),
                      icon: const Icon(
                        Icons.calendar_month_sharp,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
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
                          ? "${widget.tanggalSelesai!.day}-${widget.tanggalSelesai!.month}-${widget.tanggalSelesai!.year}"
                          : "Selesai",
                      style: const TextStyle(fontSize: 20),
                    ),
                    IconButton(
                      onPressed: () => _selectDate(context, false),
                      icon: const Icon(
                        Icons.calendar_month_sharp,
                        color: Color.fromARGB(255, 255, 255, 255),
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
}
