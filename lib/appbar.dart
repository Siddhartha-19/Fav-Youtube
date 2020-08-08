import 'package:flutter/material.dart';
  
AppBar tpbar =AppBar(
backgroundColor: Colors.black,
title:Image.asset('assets/images/youtube.png',
fit: BoxFit.cover,
width:100),
actions: <Widget>[
  Padding(
    padding:EdgeInsets.only(right:20),
    child: IconButton(
      icon:Icon(Icons.videocam) , 
      onPressed: null
      )
  ),
  Padding(
    padding:EdgeInsets.only(right:20),
    child: IconButton(icon:Icon(Icons.search), onPressed: null), 
  ),
  Padding(
    padding:EdgeInsets.only(right:20),
    child: IconButton(icon: Icon(Icons.account_circle), onPressed: null), 
  )
],
);

BottomAppBar btmbar=BottomAppBar(
  color: Colors.black,
  
   child:Container(
    color: Colors.black,
    height:64.0,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
           IconButton(icon: Icon(Icons.home), onPressed:(){}),
            Text('Home'),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
           IconButton(icon: Icon(Icons.explore), onPressed:(){}),
            Text('Explore'),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
           IconButton(icon: Icon(Icons.subscriptions), onPressed:(){}),
            Text('Subscriptions'),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
           IconButton(icon: Icon(Icons.notifications), onPressed: (
             
           )
           {}),
            Text('Notifications'),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
           IconButton(icon: Icon(Icons.video_library), onPressed:(){}),
            Text('Library'),
          ],
        ),
      ],
    ),
  ),
  

);