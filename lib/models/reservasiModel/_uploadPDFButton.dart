import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UploadPDFButton extends StatefulWidget {
  final String judul;

  const UploadPDFButton({
    Key? key,
    required this.judul,
  }) : super(key: key);

  @override
  _UploadPDFButtonState createState() => _UploadPDFButtonState();
}

class _UploadPDFButtonState extends State<UploadPDFButton> {
  Future<FilePickerResult?>? _filePickerFuture;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.judul,
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              setState(() {
                _filePickerFuture = _pickPDFFile();
              });
            },
            child: Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
              ),
              child: FutureBuilder<FilePickerResult?>(
                future: _filePickerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Upload PDF max 2MB",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.picture_as_pdf,
                          color: Colors.white,
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<FilePickerResult?> _pickPDFFile() async {
    return FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
  }
}
