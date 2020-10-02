import 'package:flutter/material.dart';


Widget loading()
{
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget connectionerror()
{
  return Center(
    child: Text('خطأ في الاتصال !',style: TextStyle(color: Colors.red),),
  );
}

Widget nodata()
{
  return Center(
    child: Text('لا يوجد بيانات!',style: TextStyle(color: Colors.red),),
  );
}