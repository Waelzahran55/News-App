part of 'home_cubit.dart';


abstract class HomeState {}

class HomeInitial extends HomeState {}

class Homeloading extends HomeState {}

class HomeSuccess extends HomeState {}

class HomeError extends HomeState {
  String error;
  HomeError(this.error);
}
