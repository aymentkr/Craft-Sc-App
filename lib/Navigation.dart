import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'Screens/Home.dart';
import 'Screens/Todo/main.dart';
import 'Screens/Fitness/main.dart';
import 'Screens/Stopwatch/TimerPage.dart';

class Navigation extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
 
class _HomePageState extends State<Navigation> with SingleTickerProviderStateMixin {

int _selectedIndex  = 0;
 
PageController _pageController = PageController(
  initialPage: 0,
  keepPage: true,
);
 
Widget buildPageView() {
  return PageView(
    controller: _pageController,
    onPageChanged: (index) {
      pageChanged(index);
    },
    children: <Widget>[
      Home(),
      Todo(),
      Fitness(),
      TimerPage()
    ],
  );
}

   void pageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
      title: Row(
              children: [
                CircleAvatar(radius: 20,
               child: ClipOval(
              child: Image.asset("Images/logo.png", fit: BoxFit.contain,)
              ),
                  ),
                     Container(
                  padding: const EdgeInsets.all(8.0), child: Text('The Complete Flutter')
                  ),
            ],

          ),
          
      ),
      body: buildPageView(),
      bottomNavigationBar: BottomNavyBar(   
        selectedIndex: _selectedIndex ,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          _selectedIndex  = index;
          _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.format_list_bulleted),
            title: Text('Todo'),
            activeColor: Colors.purpleAccent,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Fitness'),
            activeColor: Colors.pink,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.alarm),
            title: Text('Stopwatch'),
            activeColor: Colors.blue,
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

 
}
