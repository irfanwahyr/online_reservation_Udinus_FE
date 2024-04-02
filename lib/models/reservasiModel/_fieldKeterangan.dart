import 'package:flutter/material.dart';

class FieldKeterangan extends StatelessWidget {
  final String judul;
  final ValueChanged<String>? onSubmitted;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  const FieldKeterangan({
          super.key,
          required this.judul,
          this.onSubmitted,
          this.controller,
          required this.keyboardType
        });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          judul,
          textAlign: TextAlign.start,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 400,
          height: 200,
          child: TextField(
            controller: controller,
            maxLines: null,
            expands: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: const Color.fromARGB(48, 142, 203, 252),
            ),
            keyboardType: keyboardType,
            textInputAction: TextInputAction.done,
            onSubmitted: onSubmitted,
            autofocus: true,
          ),
        ),
      ],
    );
  }
}
