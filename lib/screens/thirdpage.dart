import 'package:flutter/material.dart';
import 'package:task/models/city.dart';
import 'package:task/models/model.dart';
import 'package:task/utilit/utilt.dart';

class ThirdPage extends StatefulWidget {
  final int cityId;
  ThirdPage(this.cityId);
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  List<String> imagess = [
    'images/shop1.jpg',
    'images/download1.jpg',
    'images/download.jpg',
    'images/images.jpg',
    'images/images.jpg',
    'images/images.jpg',
  ];
  CityData cityData = CityData();

  @override
  Widget build(BuildContext context) {
    // int keyy=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
        centerTitle: true,
        title: Text(
          'محمد صابر',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        // manual id to get data refer to this id
        future: cityData.governoratedata(widget.cityId),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return loading();
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {
                print('erroro : ' + snapshot.error.toString());
                return connectionerror();
              } else {
                List<Cities> gov = snapshot.data;
                return _listview(gov);
              }

              break;
            case ConnectionState.none:
              return nodata();
              break;
            case ConnectionState.waiting:
              return loading();
              break;
          }
          return snapshot.data;
        },
        //
      ),
    );
  }

  Widget _listview(List<Cities> governorate) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: ExactAssetImage(governorate[index].image),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Opacity(
                    opacity: 0.56,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            Colors.black,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 140),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(
                                children: [
                                  Text(
                                    'احصل علي الاتجاهات',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Icon(Icons.my_location, color: Colors.white),
                                ],
                              ),
                            ),
                            Text(
                              governorate[index].name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        itemCount: governorate.length);
  }
}
