import 'package:flutter/material.dart';
import 'appbar.dart';
import 'dart:async';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        accentColor:Colors.white,
      ),
    home:Splash(),
    );
  }
}
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("assets/images/ylogo.jpg",height: 150,width: 150,),
      ),
    );
  }
}
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> vpic=
  [
    "assets/images/avengersinfinity.jpg",
    "assets/images/Ironman.jpg",
    "assets/images/Civilwar.jpg"
  ];
  List<String>vtitle=[
    "Avengers Infinitywar Trailer",
    "IronMan 3 Trailer",
    "Civilwar Trailer",
  ];
  List<String>vtime=[
    "4:50",
    "3:30",
    "2:20",
  ];
  Widget videos(String image, String title,String time) {
    return Column(
      
      children: <Widget>[
        Stack(
          
          children: <Widget>[
            Image.asset(image,
            fit: BoxFit.fill),
            Positioned.fill(
              bottom: 10.0,
              right: 10.0,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "$time",
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          color: Colors.black,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/Marvel.png'),
            ),
            title: Text(
              "$title",
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              "Marvel . 630M Views . 1 year ago",
            ),
            trailing: Icon(Icons.more_vert, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 10.0,
          child: Container(
            color: Colors.black,
          ),
        )
      ],
    );
  }


  @override

   

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:tpbar,
      bottomNavigationBar: btmbar,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            videos(vpic[0],vtitle[0],vtime[0]),
                  videos(vpic[1],vtitle[1],vtime[1]),
                videos(vpic[2],vtitle[2],vtime[2]),
                videos(vpic[0],vtitle[0],vtime[0]),
                  videos(vpic[1],vtitle[1],vtime[1]),

            
          ],
        ),
      )
    );
  }
}