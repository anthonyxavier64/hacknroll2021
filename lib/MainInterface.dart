import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hacknroll2021/pages/home_page.dart';
import 'package:hacknroll2021/screens/friend_page.dart';

class MainInterface extends StatefulWidget {
  @override
  _MainInterfaceState createState() => new _MainInterfaceState();
}

class _MainInterfaceState extends State<MainInterface> {
  int pageIndex = 0;

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    HomePage(),
    HomePage(),
     HomePage(),
    
  ]; // to store nested tabs

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentScreen =
                HomePage(); // if user taps on this dashboard tab will be active
            currentTab = 3;
          });
        },
        backgroundColor: Colors.green[700],
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.white,
        elevation: 9.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0)),
              color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            HomePage(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return FriendPage();
                          },
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.group,
                          color:
                              currentTab == 0 ? Colors.green[900] : Colors.grey,
                        ),
                        Text(
                          'Friends',
                          style: TextStyle(
                            color: currentTab == 0
                                ? Colors.green[900]
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                             HomePage(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color:
                              currentTab == 2 ? Colors.green[900] : Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: currentTab == 2
                                ? Colors.green[900]
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
