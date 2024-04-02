import 'package:flutter/material.dart';
import 'package:kp2024/controllers/peminjaman_admin/acaraorganisasi_admin.dart';

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
  String? proposal_acara;
  @override
  void initState() {
    super.initState();
    proposal_acara = widget.proposal_acara;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showFile(proposal_acara!);
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
