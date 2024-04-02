import 'package:flutter/material.dart';
import 'package:kp2024/controllers/peminjaman_admin/acaraorganisasi_admin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtonProposal extends StatefulWidget {
  final String proposal_acara;

  const ButtonProposal({
    Key? key,
    required this.proposal_acara,
  }) : super(key: key);
  @override
  State<ButtonProposal> createState() => _ButtonProposalState();
}

class _ButtonProposalState extends State<ButtonProposal> {

  String? token;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    setState(() {
      this.token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(token);
        showFile(token!, widget.proposal_acara);

      },
      child: Container(
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          color: Color.fromARGB(0, 226, 198, 74),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(Icons.picture_as_pdf_sharp, color: Colors.blue),
        ),
      ),
    );
  }
}
