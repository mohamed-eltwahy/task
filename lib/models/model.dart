class HomeApi {
  int key;
  String governorateName;
  String image;
  HomeApi({this.key, this.governorateName, this.image});
}

class Governorate {
  int governorateId;
  String governorateName;
  String image;
  List<Cities> cities;

  Governorate(
      {this.governorateId, this.governorateName, this.image, this.cities});
}

class Cities {
  int id;
  String image;
  String name;
  String lat;
  String long;

  Cities({this.id, this.image, this.name, this.lat, this.long});
}
