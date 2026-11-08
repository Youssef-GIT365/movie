import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  List<Object?> get props => [];
}

class getNowPlayinEvent extends MoviesEvent {}

class getpopularEvent extends MoviesEvent {}

class getTopRatedEvent extends MoviesEvent {}
