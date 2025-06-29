import 'package:flutter/material.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/ui/home/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: HomeView(),
        ),
      ),
    );
  }
}
