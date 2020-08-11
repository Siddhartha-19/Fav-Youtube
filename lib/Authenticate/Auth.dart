import 'package:flutter/material.dart';
import 'Sign-in.dart';
import 'register.dart';
class Authenticate  extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate > {
  bool showsignin=true;
  void toggleView()
  {
    setState(() {
      showsignin=!showsignin;
    });
  }
  @override
  Widget build(BuildContext context) {
   if(showsignin)
   {
    return Signin(scheck: toggleView);
   }
   else{
     return Register(scheck: toggleView);
   }
  }
}