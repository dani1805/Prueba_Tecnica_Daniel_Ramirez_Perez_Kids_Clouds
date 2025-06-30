import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/app/data/entity/event_model.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/app/helpers/colors.dart';

class StandardEventCard extends StatelessWidget {
  const StandardEventCard({super.key, required this.event});

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: CircleAvatar(
                    backgroundColor: Mcolor.pastel,
                    radius: 50,
                    backgroundImage: NetworkImage(event.image),
                  ),
                ),
                SizedBox(width: 10),

                Flexible(
                  flex: 2,
                  child: Text(
                    event.name,
                    style: GoogleFonts.openSans(color: Mcolor.brown),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              event.date,
              style: GoogleFonts.openSans(color: Colors.blueGrey, fontSize: 15),
            ),
            SizedBox(height: 20),
            Text(event.description, style: GoogleFonts.openSans(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
