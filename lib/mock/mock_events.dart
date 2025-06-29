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

class MockEvents {
  static List<EventModel> events = [
    EventModel(
      name: 'Alimentación complementaria',
      date: '28/06/2025 11:00',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nulla quam, faucibus in nulla sit amet, tempus commodo libero. Nulla ligula quam, euismod quis odio',
      image: Children.daniel.image,
      child: Children.daniel.id,
      activity: Activities.food.id,
    ),
    EventModel(
      name: 'Alimentación',
      date: '28/06/2025 11:00',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nulla quam, faucibus in nulla sit amet, tempus commodo libero. Nulla ligula quam, euismod quis odio',
      image: Children.daniel.image,
      child: Children.daniel.id,
      activity: Activities.food.id,
    ),
    EventModel(
      name: 'Siestas 1',
      date: '28/06/2025 11:30',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nulla quam, faucibus in nulla sit amet, tempus commodo libero. Nulla ligula quam, euismod quis odio',
      image: Children.hugo.image,
      child: Children.hugo.id,
      activity: Activities.naps.id,
    ),
    EventModel(
      name: 'Actividades 1',
      date: '28/06/2025 10:10',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nulla quam, faucibus in nulla sit amet, tempus commodo libero. Nulla ligula quam, euismod quis odio',
      image: Children.hugo.image,
      child: Children.hugo.id,
      activity: Activities.naps.id,
    ),
    EventModel(
      name: 'Deposiciones 1',
      date: '28/06/2025 08:10',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nulla quam, faucibus in nulla sit amet, tempus commodo libero. Nulla ligula quam, euismod quis odio',
      image: Children.ana.image,
      child: Children.ana.id,
      activity: Activities.naps.id,
    ),
    EventModel(
      name: 'Deposiciones 2',
      date: '28/06/2025 10:35',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nulla quam, faucibus in nulla sit amet, tempus commodo libero. Nulla ligula quam, euismod quis odio',
      image: Children.ana.image,
      child: Children.ana.id,
      activity: Activities.naps.id,
    ),
    EventModel(
      name: 'Deposiciones 3',
      date: '28/06/2025 13:10',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nulla quam, faucibus in nulla sit amet, tempus commodo libero. Nulla ligula quam, euismod quis odio',
      image: Children.ana.image,
      child: Children.ana.id,
      activity: Activities.bowelmovements.id,
    ),
    EventModel(
      name: 'Observaciones',
      date: '28/06/2025 09:40',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nulla quam, faucibus in nulla sit amet, tempus commodo libero. Nulla ligula quam, euismod quis odio',
      image: Children.daniel.image,
      child: Children.daniel.id,
      activity: Activities.bowelmovements.id,
    ),
  ];
}
