// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class StandardButton extends StatelessWidget {
  const StandardButton({
    Key? key,
    required this.text,
    required this.color,
    required this.background,
    required this.border,
    this.height,
    this.onTap,
    this.width,
  }) : super(key: key);

  final String text;
  final Color color;
  final Color background;
  final Color border;
  final double? width;
  final double? height;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: background,
          border: Border.all(color: border),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: color),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
