import 'dart:async';
import './Onboarding/slide_dots.dart';
import './Onboarding/slide_item.dart';
import 'package:flutter/material.dart';
import './authentication/signup.dart';
import './authentication/login.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color left = Colors.black;
  Color right = Colors.white;

  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      Duration(seconds: 5),
      (Timer timer) {
        if (_currentPage < 4) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        if (_pageController.hasClients) {
          _pageController.animateToPage(
            _currentPage,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        }
      },
    );
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    NotificationListener<OverscrollIndicatorNotification>(
                      onNotification:
                          (OverscrollIndicatorNotification overscroll) {
                        overscroll.disallowGlow();
                        return;
                      },
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: _pageController,
                        onPageChanged: _onPageChanged,
                        itemCount: 3,
                        itemBuilder: (ctx, i) => SlideItem(i),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < 3; i++)
                          if (i == _currentPage)
                            SlideDots(true)
                          else
                            SlideDots(false)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                  Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 0.0),
                  child: GestureDetector(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .22,
                        ),
                        ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width * .1,
                          height: MediaQuery.of(context).size.height * .06,
                          child: RaisedButton(
                            elevation: 0.0,
                            splashColor: Colors.transparent,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(8.0)),
                            padding:
                                EdgeInsets.only(top: 7.0, bottom: 7.0, left: 0),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => RegistrationPage(),
                                ),
                              );
                            },
                            child: new Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                .02,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                .02),
                                    child: new Text("Sign Up",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        )))
                              ],
                            ),
                            textColor: Colors.black,
                            color: Colors.transparent,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .07,
                        ),
                        ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width * .1,
                          height: MediaQuery.of(context).size.height * .06,
                          child: RaisedButton(
                            elevation: 0.0,
                            splashColor: Colors.transparent,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(8.0)),
                            padding:
                                EdgeInsets.only(top: 7.0, bottom: 7.0, left: 0),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => LoginPage(),
                                ),
                              );
                            },
                            child: new Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 20.0, right: 20),
                                    child: new Text("Log In",
                                        style: TextStyle(
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        )))
                              ],
                            ),
                            textColor: Colors.black,
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
