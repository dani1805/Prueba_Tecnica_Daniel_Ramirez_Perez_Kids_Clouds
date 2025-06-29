import 'package:flutter/material.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/app/helpers/colors.dart';

class StandardLoading extends StatelessWidget {
  const StandardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Mcolor.blue),
      ),
    );
  }
}
