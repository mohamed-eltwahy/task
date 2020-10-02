import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:task/models/api.dart';
import 'package:task/models/model.dart';
import 'package:task/screens/thirdpage.dart';
import 'package:task/utilit/utilt.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  HomeInfo homeinfo = HomeInfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(
              Icons.filter_list,
              color: Colors.black,
            ),
          )
        ],
        centerTitle: true,
        title: Text(
          'الرئيسية',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: homeinfo.getinfo(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return loading();
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {
                return connectionerror();
              } else {
                List<HomeApi> info = snapshot.data;
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  itemCount: info.length,
                  itemBuilder: (BuildContext context, int index) =>
                      customgridview(context,
                           index,  info[index]),
                  staggeredTileBuilder: (int index) =>
                      new StaggeredTile.count(2, 3),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                );
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
      ),
    );
  }
}

Widget customgridview(context,index,HomeApi inf)
{
  return (index % 2 != 1)
        ? Transform.translate(
            offset: Offset(0, 60),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Container(
                        
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: 
                               (inf.image== null)
                                  ? Container()
                                  : NetworkImage(inf.image),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        color: Colors.white,
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            inf.governorateName,
                            style: TextStyle(
                                color: Colors.green.shade500, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: (inf.image== null)
                                ? Container()
                                : NetworkImage(inf.image),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      color: Colors.white,
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          inf.governorateName,
                          style: TextStyle(
                              color: Colors.green.shade500, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
}

  // Widget checkUrl(HomeApi inff) {
  //   try {
  //     return Image.network(inf.image,
  //         height: 70.0, width: 70.0, fit: BoxFit.cover);
  //   } catch (e) {
  //     return Icon(Icons.image);
  //   }
  // }


   // Navigator.of(context)
                        //     .pushNamed(ThirdPage.id, arguments: inf.key);
