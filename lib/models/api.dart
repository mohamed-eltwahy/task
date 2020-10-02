import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:task/utilit/urls.dart';
import 'package:task/models/model.dart';

class HomeInfo {
  Future<List<HomeApi>> getinfo() async {
    List<HomeApi> information = [];
    String url = home;
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsondata = jsonDecode(response.body);
      var data = jsondata['data']['governorates']['data'];
      for (var items in data) {
        print('image : '+items['image']);
        HomeApi homeapi = HomeApi(
          key: items['key'],
          governorateName: items['governorate_name'],
          image: items['image'],
        );
        information.add(homeapi);
      }
    }

    return information;
  }
}
