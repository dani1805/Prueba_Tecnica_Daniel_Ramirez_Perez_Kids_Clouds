import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/app/helpers/colors.dart';

class StandardKidsItem extends StatelessWidget {
  const StandardKidsItem({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Mcolor.pastel,
          backgroundImage: NetworkImage(image),
        ),
        SizedBox(width: 10),
        Text(title, style: GoogleFonts.openSans(color: Mcolor.blue)),
      ],
    );
  }
}

//
