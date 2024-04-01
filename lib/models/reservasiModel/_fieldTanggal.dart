import 'package:flutter/material.dart';

class FieldTanggal extends StatefulWidget {
  final String judul;
  String tanggal_Mulai;
  DateTime? tanggal_Selesai;
  final ValueChanged<DateTime?>? onDateChanged;

  FieldTanggal({
    Key? key,
    required this.judul,
    required this.tanggal_Mulai,
    this.tanggal_Selesai,
    this.onDateChanged,
  }) : super(key: key);

  @override
  State<FieldTanggal> createState() => _FieldTanggalState();
}

class _FieldTanggalState extends State<FieldTanggal> {
  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: isStartDate
          ? DateTime.parse(widget.tanggal_Mulai)
          : widget.tanggal_Selesai ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.utc(2040, 3, 14),
    );

    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          widget.tanggal_Mulai = pickedDate.toString();
        } else {
          widget.tanggal_Selesai = pickedDate;
          widget.onDateChanged?.call(pickedDate);
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
                            widget.tanggal_Mulai,
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
                              widget.tanggal_Mulai,
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
                            widget.tanggal_Selesai != null
                                ? "${widget.tanggal_Selesai!.day.toString().padLeft(2, '0')}-${widget.tanggal_Selesai!.month.toString().padLeft(2, '0')}-${widget.tanggal_Selesai!.year}"
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
                              widget.tanggal_Selesai != null
                                  ? "${widget.tanggal_Selesai!.day.toString().padLeft(2, '0')}-${widget.tanggal_Selesai!.month.toString().padLeft(2, '0')}-${widget.tanggal_Selesai!.year}"
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
