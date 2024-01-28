import 'package:flutter/material.dart';
import 'package:kp2024/models/_heading1.dart';

class CardLab extends StatefulWidget {
  final String imageAsset;
  final String nama;
  final VoidCallback? onTap;

  const CardLab({super.key, 
    required this.imageAsset,
    required this.nama,
    required this.onTap,
  });

  @override
  _CardLabState createState() => _CardLabState();
}

class _CardLabState extends State<CardLab> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }

        _animationController.forward().then((_) {
          _animationController.reverse();
        });
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Card(
          elevation: 5.0,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(widget.imageAsset),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Heading1(text: widget.nama, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
