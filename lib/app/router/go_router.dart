import 'package:go_router/go_router.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/app/router/routes.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/ui/home/home_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(path: Routes.home, builder: (context, state) => const HomePage()),
  ],
);
