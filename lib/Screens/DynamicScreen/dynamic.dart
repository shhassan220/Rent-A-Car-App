import 'package:flutter/material.dart';
import '../location/location_map_screen.dart';
import '../posts/history_screen.dart';
import '../home_screen/home_screen.dart';

class DynamicScreen extends StatefulWidget {
  @override
  State<DynamicScreen> createState() => _DynamicScreenState();
}

class _DynamicScreenState extends State<DynamicScreen> {
  int _selectedPageIndex = 0;

  void selectedIndex(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  List <Widget> screens = [
    HomeScreen(),
    LocationMap(),
    HistoryScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedPageIndex],
      bottomNavigationBar: Container(
        height: 75,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            elevation: 1,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black87,
            currentIndex: _selectedPageIndex,
            onTap: (i) => bottomClick(i),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_on),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history_outlined),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );

  }
  void bottomClick (int val){
    setState(() {
      _selectedPageIndex = val;
    });
    if(val == 0){
    }
    else if(val == 1){
    }
    else if(val == 2){
    }
  }
}
