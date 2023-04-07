import 'package:flutter/material.dart';
import 'package:leukemia_detection/view/screens/test_screen.dart';
import 'history.dart';
import 'home_screen.dart';

class AppLayout extends StatefulWidget {
  AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> appScreens = [
    const HomeScreen(),
    TestScreen(),
    const HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
              child: appScreens[selectedIndex]
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap:(index){
            onItemTapped(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Test'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History'
            ),
          ]
        )
    );
  }
}
