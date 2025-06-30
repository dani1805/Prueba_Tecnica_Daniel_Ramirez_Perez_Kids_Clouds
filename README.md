## 🧠 Enfoque del proyecto

Decidí construir la app con una estructura modular, separando claramente los datos mockeados, los widgets y la lógica de filtrado.

La interfaz está pensada primero para móvil (mobile-first), pero adaptada también a escritorio. Elegí colores suaves y me enfoqué en que el contenido sea fácil de leer para padres/madres.

En caso de no tener instalado el framework de Flutter, seguir los pasos comentados en esta documentación:

https://docs.flutter.dev/install

En caso de tener instalado Flutter, para instalar el proyecto, seguir estos pasos:

1. Clonar el repositorio:
   ```bash
   git clone https://github.com/dani1805/Prueba_Tecnica_Daniel_Ramirez_Perez_Kids_Clouds.git
   cd Prueba_Tecnica_Daniel_Ramirez_Perez_Kids_Clouds

2. Instalar dependencias:
   ```bash
   flutter pub get

3. Ejecutar la app:
   ```bash
   flutter run

4. Ejecutar los tests:
   ```bash
   flutter test
   ```

## 🧪 Test automático incluido

Agregué un test de widget sencillo para comprobar que al seleccionar una categoría, se muestran solo los eventos correspondientes. El test está en la carpeta `/test/` y se puede ejecutar con `flutter test`.


## 📝 Notas finales

La estructura está pensada para poder escalar si se necesitara convertir esto en una aplicación real.

