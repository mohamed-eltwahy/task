import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:task/utilit/urls.dart';
import 'package:task/models/model.dart';

class CityData {
  Future<List<Governorate>> governoratedata(int id) async {
    List<Governorate> govern = [];
    String url = city;
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsondata = jsonDecode(response.body);
      var data = jsondata['data']['governorates'];
      for (var items in data) {
        List<Cities> listofcities = [];
        for (var listcity in items['cities']) {
          Cities cities = Cities(
            name: listcity['name'],
            id: listcity[id],
            image: listcity['image'],
            lat: listcity['lat'],
            long: listcity['long'],
          );
          listofcities.add(cities);
        }
        Governorate governorate = Governorate(
          cities: listofcities,
          governorateId: items['governorate_id'],
          governorateName: items['governorate_name'],
          image: items['image'],
        );
        govern.add(governorate);
      }
    }
    return govern;
  }
}
