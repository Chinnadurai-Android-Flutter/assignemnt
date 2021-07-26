import 'dart:io';

import 'package:Decor8/base/base_state.dart';
import 'package:Decor8/data/country_details.dart';
import 'package:Decor8/data/country_model.dart';
import 'package:Decor8/repository/api_repository.dart';
import 'package:Decor8/resources/app_errors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'country_event.dart';

class CountryBloc extends Bloc<CountryEvent, BaseState> {
  @override
  BaseState get initialState {
    return InitialState();
  }

  @override
  Stream<BaseState> mapEventToState(CountryEvent event) async* {
    if (event is GetCountry) {
      yield* mapFetchCountryDetails();
    }
  }

  Stream<BaseState> mapFetchCountryDetails() async* {
    yield LoadingState();
    try {
      final response = await APIRepository().getIndiaDetails();
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
