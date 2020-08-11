import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Add extends StatefulWidget {
  @override
  
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  String Url;
  String likes;
  String dislike;
  Future<bool> addDialog(BuildContext context) async{
    return showDialog(context: context,
    barrierDismissible: false,
    builder: (BuildContext context)
    {
      return AlertDialog(
        title: Text('Add Data'),
        content: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText:'Enter the URL'),
              onChanged: (value)
              {
                this.Url=value;
              },
            ),
            SizedBox(height: 5),
           TextField(
              decoration: InputDecoration(hintText:'Enter the Likes'),
              onChanged: (value)
              {
                this.likes=value;
              },
            ),
            TextField(
              decoration: InputDecoration(hintText:'Enter the dislikes'),
              onChanged: (value)
              {
                this.dislike=value;
              },
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed:(){
              Navigator.of(context).pop();
              Map vData ={'Url':this.Url,'likes':this.likes,'dislike':this.dislike};
             Firestore.instance.runTransaction((Transaction vtransaction)
             async{
              CollectionReference reference=Firestore.instance.collection('Yvideos');
             reference.add(vData).then((result){
              dialogTrigger(context);
              }).catchError((e)
              {
                print(e);
              });
             } );
             
             // Firestore.instance.collection('Yvideos').add(vData).
            }, 
            child: Text('Add'),
            textColor: Colors.blue,

          )
        ],
      );
    }
    );
  }
  Future<bool> dialogTrigger(BuildContext context) async
  {
    return showDialog(context: context,
    barrierDismissible: false,
    builder: (BuildContext context)
    {
      return AlertDialog(
        title: Text('Done'),
        content: Text('Added'),
        actions: <Widget>[
          FlatButton(onPressed: ()
          {
            Navigator.of(context).pop();
          }, child: Text('OK'),
          textColor: Colors.red,
          )
        ],
      );
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add your video'),
        actions: <Widget>[
           IconButton(icon:Icon(Icons.add), onPressed: (){
             addDialog(context);

           })
        ],
      ),
    );
  }
}