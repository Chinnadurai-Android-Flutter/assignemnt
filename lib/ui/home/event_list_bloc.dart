import 'dart:io';

import 'package:Decor8/base/base_state.dart';
import 'package:Decor8/data/country_details.dart';
import 'package:Decor8/data/country_model.dart';
import 'package:Decor8/repository/api_repository.dart';
import 'package:Decor8/resources/app_errors.dart';
import 'package:Decor8/ui/home/event_list_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventListBloc extends Bloc<EventListEvent, BaseState> {
  @override
  BaseState get initialState {
    return InitialState();
  }

  @override
  Stream<BaseState> mapEventToState(EventListEvent event) async* {
    if (event is GetCountryList) {
      yield* mapFetchCountryList();
    }
  }

  Stream<BaseState> mapFetchCountryList() async* {
    yield LoadingState();
    try {
      final response = await APIRepository().getCountryList();
      List<Country> itemList = [];
      // var data = json.decode(response);
      for (var country in response) {
        CountryDetails data = CountryDetails.fromJson(country);
        itemList.add(Country(
            countryName: data.name,
            currencyCode: data.currencies[0].code,
            currencyValues: "1",
            flag: data.flag,
            symbol: data.currencies[0].symbol));
      }
      yield SuccessState(successResponse: itemList);
    } on SocketException {
      print("Socket Exception");
      yield FailureState(errorMessage: AppErrors.connectionError);
    } catch (onError) {
      print("catch");
      print(onError);
      yield FailureState(errorMessage: onError.toString());
    }
  }
}
