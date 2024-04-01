import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UploadPDFButton extends StatefulWidget {
  final String judul;
  final ValueChanged<PlatformFile?>? onFileSelected;

  const UploadPDFButton({
    Key? key,
    required this.judul,
    this.onFileSelected,
  }) : super(key: key);

  @override
  _UploadPDFButtonState createState() => _UploadPDFButtonState();
}

class _UploadPDFButtonState extends State<UploadPDFButton> {
  late String? _fileName;
  late String? _extension;

  Future<FilePickerResult?>? _filePickerFuture;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              setState(() {
                _filePickerFuture = _pickPDFFile();
              });
            },
            child: Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: EdgeInsets.only(right:15, left: 15),
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
                      if (snapshot.data != null) {
                        _fileName = snapshot.data!.files.single.name;
                        _extension = _fileName!.split('.').last;
                      } else {
                        _fileName = null;
                        _extension = null;
                      }

                      
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible( // Gunakan Flexible untuk menangani overflow
                            child: Text(
                              _fileName ?? widget.judul + " Max. 2MB",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
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
            ),
          )
        ],
      ),
    );
  }

  Future<FilePickerResult?> _pickPDFFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      widget.onFileSelected?.call(result.files.single);
    }

    return result;
  }
}
