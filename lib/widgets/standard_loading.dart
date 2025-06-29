import 'package:flutter/material.dart';

class StandardLoading extends StatelessWidget {
  const StandardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
      ),
    );
  }
}
