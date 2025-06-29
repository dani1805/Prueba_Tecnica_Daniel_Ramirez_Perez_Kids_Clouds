// ignore_for_file: override_on_non_overriding_member

part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class HomePageLoaded extends HomeEvent {
  HomePageLoaded();

  @override
  List<Object?> get props => [];
}

class ButtonChildPressed extends HomeEvent {
  final int child;

  ButtonChildPressed({required this.child});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class ButtonActivityPressed extends HomeEvent {
  final int activity;

  ButtonActivityPressed({required this.activity});

  @override
  List<Object?> get props => throw UnimplementedError();
}
