import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/app/data/entity/event_model.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/mock/mock_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<EventModel> events = List.empty(growable: true);
  int? child;
  int? activity;

  HomeBloc() : super(HomeInitial()) {
    on<HomePageLoaded>((event, emit) async {
      emit(HomeLoading());
      events = MockData.events;
      emit(HomeLoaded());
    });

    on<ButtonChildPressed>((event, emit) async {
      emit(HomeLoading());
      child = event.child;
      events =
          activity != null
              ? MockData.events
                  .where((x) => x.child == child && x.activity == activity)
                  .toList()
              : MockData.events.where((x) => x.child == child).toList();

      emit(HomeLoaded());
    });

    on<ButtonActivityPressed>((event, emit) async {
      emit(HomeLoading());
      activity = event.activity;

      events =
          child != null
              ? MockData.events
                  .where(
                    (x) => x.child == child && x.activity == event.activity,
                  )
                  .toList()
              : MockData.events
                  .where((x) => x.activity == event.activity)
                  .toList();
      emit(HomeLoaded());
    });
  }
}
