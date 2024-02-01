import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UploadPDFButton extends StatelessWidget {
  final String judul;
  const UploadPDFButton({super.key, 
    required this.judul,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            judul,
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () => _pickPDFFile(context),
            child: Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Upload PDF max 2MB",
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
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _pickPDFFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      // Handle the selected PDF file
      String filePath = result.files.first.path ?? '';
      print("Selected PDF file path: $filePath");

      // You can implement further logic based on the selected file
      // For example, you may want to check the file size and display an error
      // if it exceeds 2MB.
    }
  }
}
