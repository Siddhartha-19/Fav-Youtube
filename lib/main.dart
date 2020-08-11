import 'package:flutter/material.dart';
import 'package:youtube_ui/add.dart';
import 'appbar.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:youtube_ui/Authenticate/Auth.dart';
import 'Model-user/user.dart';
import 'A-service/s-auth.dart';
import 'Home.dart';
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
    home:Quick(),
    );
  }
}
class Quick extends StatefulWidget {
  @override
  _QuickState createState() => _QuickState();
}

class _QuickState extends State<Quick> {



  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value:ServiceAuth().user, 
    child :MaterialApp(
     home: Checkin()
    )
  );
  }
}
class Checkin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);
    
    if(user==null)
    {
    return Authenticate();
      }
    else{
      return Homepage();
    }
  }
}
