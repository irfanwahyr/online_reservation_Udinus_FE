import 'package:flutter/material.dart';
import 'package:kp2024/controllers/lab_admin/data_lab_admin.dart';
import 'package:kp2024/controllers/lab_admin/hardware_admin.dart';
import 'package:kp2024/controllers/lab_admin/software_admin.dart';
import 'package:kp2024/pages/admin/daftarLaboratorium.dart';

class EditDaftarLaboratorium extends StatefulWidget {
  final int id;
  final int id_lab;
  final String nama_lab;
  final String token;
  final int jumlah_pc;
  final String jenis_lab;
  final String processor;
  final String ram;
  final String gpu;
  final String monitor;
  final String storage;
  final String software1;
  final String software2;
  final String software3;
  final String software4;
  final String software5;
  final Future? futureDataDaftarLaboratorium;


  EditDaftarLaboratorium(
      {
        required this.id_lab,
        required this.id,
      required this.nama_lab,
      required this.token,
      required this.jumlah_pc,
      required this.jenis_lab,
      required this.processor,
      required this.ram,
      required this.gpu,
      required this.monitor,
      required this.storage,
      required this.software1,
      required this.software2,
      required this.software3,
      required this.software4,
      required this.software5,
      this.futureDataDaftarLaboratorium});

  @override
  State<EditDaftarLaboratorium> createState() => _EditDaftarLaboratoriumState();
}

class _EditDaftarLaboratoriumState extends State<EditDaftarLaboratorium> {
  
  TextEditingController? jumlah_pc_controller = TextEditingController();
  TextEditingController? jenis_lab_controller = TextEditingController();
  TextEditingController? processor_controller = TextEditingController();
  TextEditingController? ram_controller = TextEditingController();
  TextEditingController? gpu_controller = TextEditingController();
  TextEditingController? monitor_controller = TextEditingController();
  TextEditingController? storage_controller = TextEditingController();
  TextEditingController? software1_controller = TextEditingController();
  TextEditingController? software2_controller = TextEditingController();
  TextEditingController? software3_controller = TextEditingController();
  TextEditingController? software4_controller = TextEditingController();
  TextEditingController? software5_controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    jumlah_pc_controller = TextEditingController(text: widget.jumlah_pc.toString());
    jenis_lab_controller = TextEditingController(text: widget.jenis_lab);
    processor_controller = TextEditingController(text: widget.processor);
    ram_controller = TextEditingController(text: widget.ram);
    gpu_controller = TextEditingController(text: widget.gpu);
    monitor_controller = TextEditingController(text: widget.monitor);
    storage_controller = TextEditingController(text: widget.storage);
    software1_controller = TextEditingController(text: widget.software1);
    software2_controller = TextEditingController(text: widget.software2);
    software3_controller = TextEditingController(text: widget.software3);
    software4_controller = TextEditingController(text: widget.software4);
    software5_controller = TextEditingController(text: widget.software5);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Data'),
      content: SingleChildScrollView(
          child: FutureBuilder(
        future: widget.futureDataDaftarLaboratorium,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  
                  controller: jumlah_pc_controller,
                  decoration: InputDecoration(labelText: 'Jumlah PC'),
                ),
                TextFormField(
                  
                  controller: jenis_lab_controller,
                  decoration: InputDecoration(labelText: 'Jenis Lab'),
                ),
                TextFormField(
                  
                  controller: processor_controller,
                  decoration: InputDecoration(labelText: 'Processor'),
                ),
                TextFormField(
                  
                  controller: ram_controller,
                  decoration: InputDecoration(labelText: 'RAM'),
                ),
                TextFormField(
                  
                  controller: gpu_controller,
                  decoration: InputDecoration(labelText: 'GPU'),
                ),
                TextFormField(
                  
                  controller: monitor_controller,
                  decoration: InputDecoration(labelText: 'Monitor'),
                ),
                TextFormField(
                
                  controller: storage_controller,
                  decoration: InputDecoration(labelText: 'Storage'),
                ),
                TextFormField(
                 
                  controller: software1_controller,
                  decoration: InputDecoration(labelText: 'software 1'),
                ),
                TextFormField(
                 
                  controller: software2_controller,
                  decoration: InputDecoration(labelText: 'software 2'),
                ),
                TextFormField(
                  
                  controller: software3_controller,
                  decoration: InputDecoration(labelText: 'software 3'),
                ),
                TextFormField(
                
                  controller: software4_controller,
                  decoration: InputDecoration(labelText: 'software 4'),
                ),
                TextFormField(
              
                  controller: software5_controller,
                  decoration: InputDecoration(labelText: 'software 5'),
                ),
              ],
            );
          }
        },
      )),
      actions: [
        ElevatedButton(
          onPressed: () async {
            await update_lab(
              widget.nama_lab,
              int.parse(jumlah_pc_controller!.text),
              jenis_lab_controller!.text,
              widget.id,
              widget.token
              );
            await update_software(widget.token, 
              software1_controller!.text, 
              software2_controller!.text, 
              software3_controller!.text, 
              software4_controller!.text, 
              software5_controller!.text, 
              widget.id, 
              widget.id_lab);
            await update_hardware(
              processor_controller!.text,
              int.parse(ram_controller!.text),
              gpu_controller!.text,
              int.parse(monitor_controller!.text),
              storage_controller!.text,
              widget.id_lab,
              widget.id,
              widget.token
              );
            Navigator.of(context).pop();
            Navigator.pushNamed(context, DaftarLaboratorium.nameRoute);
          },
          child: Text('Simpan'),
        ),
      ],
    );
  }
}
