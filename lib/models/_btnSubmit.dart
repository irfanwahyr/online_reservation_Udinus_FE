import 'package:flutter/material.dart';

class ButtonSubmit {
  ElevatedButton buildButtonSubmit({
    required String text,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(
            255, 43, 204, 48), // Set button background color to green
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white, // Set text color to white
        ),
      ),
    );
  }
}
