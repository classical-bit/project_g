import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_g/Screens/University.dart';
import 'package:project_g/util/color.dart';

bool man = false;
bool woman = false;
bool eyeryone = false;

class ShowGender extends StatefulWidget {
  @override
  _ShowGenderState createState() => _ShowGenderState();
}

class _ShowGenderState extends State<ShowGender> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  snackbar(String text) {
    final snackBar = SnackBar(
      content: Text('$text '),
      duration: Duration(seconds: 1),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      floatingActionButton: AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(milliseconds: 50),
        child: Padding(
          padding: const EdgeInsets.only(top: 90.0),
          child: FloatingActionButton(
            elevation: 10,
            child: IconButton(
              color: secondryColor,
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.white38,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Stack(
        children: <Widget>[
          Padding(
            child: Text(
              "Show me",
              style: TextStyle(fontSize: 40),
            ),
            padding: EdgeInsets.only(left: 50, top: 120),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  highlightedBorderColor: primaryColor,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .065,
                    width: MediaQuery.of(context).size.width * .75,
                    child: Center(
                        child: Text("MEN",
                            style: TextStyle(
                                fontSize: 20,
                                color: man ? primaryColor : secondryColor,
                                fontWeight: FontWeight.bold))),
                  ),
                  borderSide: BorderSide(
                      width: 1,
                      style: BorderStyle.solid,
                      color: man ? primaryColor : secondryColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {
                    setState(() {
                      woman = false;
                      man = true;
                      eyeryone = false;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: OutlineButton(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .065,
                      width: MediaQuery.of(context).size.width * .75,
                      child: Center(
                          child: Text("WOMEN",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: woman ? primaryColor : secondryColor,
                                  fontWeight: FontWeight.bold))),
                    ),
                    borderSide: BorderSide(
                      color: woman ? primaryColor : secondryColor,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    onPressed: () {
                      setState(() {
                        woman = true;
                        man = false;
                        eyeryone = false;
                      });
                      // Navigator.push(
                      //     context, CupertinoPageRoute(builder: (context) => OTP()));
                    },
                  ),
                ),
                OutlineButton(
                  focusColor: primaryColor,
                  highlightedBorderColor: primaryColor,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .065,
                    width: MediaQuery.of(context).size.width * .75,
                    child: Center(
                        child: Text("EVERYONE",
                            style: TextStyle(
                                fontSize: 20,
                                color: eyeryone ? primaryColor : secondryColor,
                                fontWeight: FontWeight.bold))),
                  ),
                  borderSide: BorderSide(
                      width: 1,
                      style: BorderStyle.solid,
                      color: eyeryone ? primaryColor : secondryColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {
                    setState(() {
                      woman = false;
                      man = false;
                      eyeryone = true;
                    });
                    // Navigator.push(
                    //     context, CupertinoPageRoute(builder: (context) => OTP()));
                  },
                ),
              ],
            ),
          ),
          man || woman || eyeryone
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(25),
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    primaryColor.withOpacity(.5),
                                    primaryColor.withOpacity(.8),
                                    primaryColor,
                                    primaryColor
                                  ])),
                          height: MediaQuery.of(context).size.height * .065,
                          width: MediaQuery.of(context).size.width * .75,
                          child: Center(
                              child: Text(
                            "CONTINUE",
                            style: TextStyle(
                                fontSize: 15,
                                color: textColor,
                                fontWeight: FontWeight.bold),
                          ))),
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => University()));
                      },
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: MediaQuery.of(context).size.height * .065,
                          width: MediaQuery.of(context).size.width * .75,
                          child: Center(
                              child: Text(
                            "CONTINUE",
                            style: TextStyle(
                                fontSize: 15,
                                color: secondryColor,
                                fontWeight: FontWeight.bold),
                          ))),
                      onTap: () {
                        snackbar("Please select one");
                      },
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
