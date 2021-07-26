import 'package:equatable/equatable.dart';

abstract class CountryEvent extends Equatable {
  const CountryEvent();

  @override
  List<Object> get props => null;
}

class GetCountry extends CountryEvent {}
class GetCountryDetails extends CountryEvent {}
