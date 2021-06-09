import 'package:Decor8/networking/api_provider.dart';

class APIRepository {
  ApiProvider provider = ApiProvider();

  Future<dynamic> getCountryList() async {
    final response = await provider.get(url: "all");
    return response;
  }

  Future<dynamic> getIndiaDetails() async {
    final response = await provider.get(url: "name/india");
    return response;
  }
}
