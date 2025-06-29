// ignore_for_file: library_prefixe

import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/config/environment.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/config/service_locator.dart';

class Config {
  static void setup(BuildVariant buildVariant) {
    Environment.init(buildVariant);
    ServiceLocator.setup(Environment.instance);
  }
}
