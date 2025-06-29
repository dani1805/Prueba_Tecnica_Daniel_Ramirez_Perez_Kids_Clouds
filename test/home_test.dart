import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/app/data/entity/event_model.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/mock/mock_data.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/ui/home/home_page.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/ui/home/home_bloc.dart';

class MockHomeBloc extends Mock implements HomeBloc {}

class FakeHomeState extends Fake implements HomeState {}

class FakeHomeEvent extends Fake implements HomeEvent {}

void main() {
  late MockHomeBloc homeBloc;

  setUpAll(() {
    registerFallbackValue(FakeHomeState());
    registerFallbackValue(FakeHomeEvent());
  });

  setUp(() {
    homeBloc = MockHomeBloc();
  });

  testWidgets(
    'Pulsar botón "Actividades" muestra eventos con texto "Actividad"',
    (WidgetTester tester) async {
      final fakeEvents = [
        EventModel(
          name: 'Actividad',
          description: 'Descripción de una actividad',
          image: Children.daniel.image,
          date: '29/06/2025 10:30',
          child: Children.daniel.id,
          activity: Activities.activities.id,
        ),
      ];

      when(() => homeBloc.state).thenReturn(HomeLoaded());
      when(() => homeBloc.stream).thenAnswer((_) => Stream<HomeState>.empty());
      when(() => homeBloc.events).thenReturn(fakeEvents);
      when(() => homeBloc.activity).thenReturn(Activities.activities.id);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          EasyLocalization(
            supportedLocales: const [Locale('es')],
            path: 'assets/translations',
            fallbackLocale: const Locale('es'),
            startLocale: const Locale('es'),
            child: MaterialApp(
              home: BlocProvider<HomeBloc>.value(
                value: homeBloc,
                child: const HomePage(),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        final activitiesButton = find.byKey(const Key('activities_key'));
        await tester.ensureVisible(activitiesButton);
        await tester.pumpAndSettle();

        await tester.tap(activitiesButton);
        await tester.pumpAndSettle();
        expect(find.textContaining('Actividad'), findsWidgets);
      });
    },
  );
}
