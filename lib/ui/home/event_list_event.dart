import 'package:equatable/equatable.dart';

abstract class EventListEvent extends Equatable {
  const EventListEvent();

  @override
  List<Object> get props => null;
}

class GetCountryList extends EventListEvent {}
