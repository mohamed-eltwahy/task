import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:task/screens/secondpage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Center(
            child: Icon(
              Icons.map,
              color: Color(0XFF003051),
            ),
          ),
          Center(
            child: Icon(
              Icons.near_me,
              color: Color(0XFF003051),
            ),
          ),
          SecondPage(),
          Center(
            child: Icon(
              Icons.shopping_cart,
              color: Color(0XFF003051),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        unselectedItemColor: Colors.black,
       // itemOutlineColor: Colors.white,
        selectedItemColor: Colors.white,
        itemBackgroudnColor: Colors.green.shade800,
        backgroundColor: Colors.transparent,
        items: [
          CustomBottomNavigationBarItem(
            icon: Icons.bookmark_border,
            title: "Saved",
          
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.location_on,
            title: "Location",
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.home,
            title: "Home",
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.search,
            title: "Search",
          ),
        ],
        onTap: (index) {
          _pageController.animateToPage(index,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 600));
        },
      ),
    );
  }
}
