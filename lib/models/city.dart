import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:task/utilit/urls.dart';
import 'package:task/models/model.dart';

class CityData {
  Future<List<Cities>> governoratedata(int id) async {
    List<Cities> citiies = [];
    String url = city;
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsondata = jsonDecode(response.body);
      //print('jsondata : '+jsondata.toString());
      List<dynamic> data = jsondata['data']['governorate']['cities'];
      print('data : '+data.toString());
      for(int i = 0; i < data.length; i++){
        Cities cities = Cities(
            name: data[i]['name'],
            id: data[i]['id'],
            image: data[i]['image'],
            lat: data[i]['lat'],
            long: data[i]['long'],
          );
          citiies.add(cities);
      }
      // for (var items in data) {
      //   List<Cities> listofcities = [];
      //   for (var listcity in items['cities']) {
      //     Cities cities = Cities(
      //       name: listcity['name'],
      //       id: listcity['id'],
      //       image: listcity['image'],
      //       lat: listcity['lat'],
      //       long: listcity['long'],
      //     );
      //     listofcities.add(cities);
      //   }
      //   Governorate governorate = Governorate(
      //     cities: listofcities,
      //     governorateId: items['governorate_id'],
      //     governorateName: items['governorate_name'],
      //     image: items['image'],
      //   );
      //   govern.add(governorate);
      // }
      print('jso35434313213213212');
    }
    return citiies;
  }
}
