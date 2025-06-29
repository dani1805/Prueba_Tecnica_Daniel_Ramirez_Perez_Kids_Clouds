import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/app/data/entity/event_model.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/mock/mock_events.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<EventModel> events = List.empty(growable: true);
  int? child;
  int? activity;

  HomeBloc() : super(HomeInitial()) {
    on<HomePageLoaded>((event, emit) async {
      emit(HomeLoading());
      events = MockEvents.events;
      emit(HomeLoaded());
    });

    on<ButtonChildPressed>((event, emit) async {
      emit(HomeLoading());
      child = event.child;
      events =
          activity != null
              ? MockEvents.events
                  .where((x) => x.child == child && x.activity == activity)
                  .toList()
              : MockEvents.events.where((x) => x.child == child).toList();

      emit(HomeLoaded());
    });

    on<ButtonActivityPressed>((event, emit) async {
      emit(HomeLoading());
      activity = event.activity;
      print(activity);

      events =
          child != null
              ? MockEvents.events
                  .where(
                    (x) => x.child == child && x.activity == event.activity,
                  )
                  .toList()
              : MockEvents.events
                  .where((x) => x.activity == event.activity)
                  .toList();
      emit(HomeLoaded());
    });
  }
}
