import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/app/data/entity/event_model.dart';

enum Children { daniel, hugo, ana }

enum Activities { food, naps, activities, bowelmovements, observations }

extension ChildrenExtension on Children {
  int get id {
    switch (this) {
      case Children.daniel:
        return 0;
      case Children.hugo:
        return 1;
      default:
        return 2;
    }
  }

  String get image {
    switch (this) {
      case Children.daniel:
        return 'https://robohash.org/daniel';
      case Children.hugo:
        return 'https://robohash.org/hugo';
      default:
        return 'https://robohash.org/ana';
    }
  }
}

extension ActivitiesExtension on Activities {
  int get id {
    switch (this) {
      case Activities.food:
        return 0;
      case Activities.naps:
        return 1;
      case Activities.activities:
        return 2;
      case Activities.bowelmovements:
        return 3;
      default:
        return 4;
    }
  }
}

class MockData {
  static List<EventModel> events = [
    EventModel(
      name: 'Alimentación',
      date: '28/06/2025 13:00',
      description:
          'Puré de verduras con pollo. Ha comido todo. Es de sus platos favoritos, junto a los macarrones con tomate',
      image: Children.daniel.image,
      child: Children.daniel.id,
      activity: Activities.food.id,
    ),
    EventModel(
      name: 'Alimentación',
      date: '18/02/2025 13:15',
      description:
          'Estofado de ternera con verduras. No ha comido todo el plato, estaba un poco molesto con los dientes',
      image: Children.daniel.image,
      child: Children.daniel.id,
      activity: Activities.food.id,
    ),
    EventModel(
      name: 'Siesta',
      date: '5/03/2025 16:00',
      description: 'No ha habido aula por la tarde',
      image: Children.hugo.image,
      child: Children.hugo.id,
      activity: Activities.naps.id,
    ),
    EventModel(
      name: 'Actividad',
      date: '03/09/2025 13:00',
      description:
          'Manualidades con plastilina. Es de sus actividades favoritas, ha realizado una figura en forma de casa maravillosa',
      image: Children.hugo.image,
      child: Children.hugo.id,
      activity: Activities.activities.id,
    ),
    EventModel(
      name: 'Deposición',
      date: '11/02/2025 12:30',
      description: 'Ha realizado una deposición',
      image: Children.ana.image,
      child: Children.ana.id,
      activity: Activities.bowelmovements.id,
    ),
    EventModel(
      name: 'Observación',
      date: '06/10/2025 10:35',
      description:
          'En la medida de lo posible, tratar de no traer juguetes propios ya que puede ocasionar posibles enfrentamientos entre ellos',
      image: Children.ana.image,
      child: Children.ana.id,
      activity: Activities.observations.id,
    ),
    EventModel(
      name: 'Actividad',
      date: '07/04/2025 08:50',
      description: 'Pintura con las manos',
      image: Children.ana.image,
      child: Children.ana.id,
      activity: Activities.activities.id,
    ),
    EventModel(
      name: 'Deposición',
      date: '17/04/2025 09:40',
      description: 'Hoy no ha realizado ninguna deposición',
      image: Children.daniel.image,
      child: Children.daniel.id,
      activity: Activities.bowelmovements.id,
    ),
  ];
}
