
import 'package:flutter/material.dart';
import 'appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'chewie-list-item.dart';
import 'package:video_player/video_player.dart';
import 'A-service/s-auth.dart';
import 'add.dart';
import 'play.dart';
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  /*List<String> vpic=
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
*/
//YoutubePlayerController _controller;
 //String videoURL;

final ServiceAuth _auth = ServiceAuth();
Widget _buildListItem(BuildContext context, DocumentSnapshot document)
{
  //Text(document['Url']);
  //videoURL=document['Url']; 
  // YoutubePlayer(controller: _controller);
 // ChewieListItem(
      
         if(document['isasset']=='true')
         {
           
          return  Container(
            
             child: Column(children: <Widget>[

              // if(document['isasset']==true)
               //{
               ChewieListItem(
                 
            videoPlayerController: VideoPlayerController.asset(
              document['Url']
            ),
            ),

            // }
             //  else
              // {
            
         
            //   },
         // Padding(
          //  padding:EdgeInsets.only(bottom:5),
            
          //child:
         // Container(
           //child: 
           Card(
             color: Colors.blue[100],
             child:Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: <Widget>[
                 Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
               IconButton(icon: Icon(Icons.thumb_up), onPressed:(){
                 Firestore.instance.runTransaction((transaction) async{
                    DocumentSnapshot freshsnap =await transaction.get(document.reference);
                    await transaction.update(freshsnap.reference,{
                      'likes':freshsnap['likes']+1,
                      'dislike':freshsnap['dislike']-1,
                    });
                 });
               }),
               Text(document['likes'].toString(),
            style: TextStyle(
              fontSize: 15,
            ),),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
        
               IconButton(icon: Icon(Icons.thumb_down), onPressed:(){
                 Firestore.instance.runTransaction((transaction) async{
                    DocumentSnapshot freshsnap =await transaction.get(document.reference);
                    await transaction.update(freshsnap.reference,{
                      'likes':freshsnap['likes']-1,
                      'dislike':freshsnap['dislike']+1,

                    });
                 });
               }),
               Text(document['dislike'].toString(),
            style: TextStyle(
              fontSize: 15,
            ),),
          ],
        ),
             ],)
           ),
          //)
         // ),

             ],));
         }
         else{
           return Container(
             child: Column(children: <Widget>[

              // if(document['isasset']==true)
               //{
              
            ChewieListItem(
            videoPlayerController: VideoPlayerController.network(
              document['Url'],
            ),
          ),

         
            //   },
          //Padding(
           // padding:EdgeInsets.only(bottom:5),
            
          //child:
        //  Container(
           //child: 
           Card(
             color: Colors.blue[100],
             child:Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: <Widget>[
                 Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
               IconButton(icon: Icon(Icons.thumb_up), onPressed:(){
                 Firestore.instance.runTransaction((transaction) async{
                    DocumentSnapshot freshsnap =await transaction.get(document.reference);
                    await transaction.update(freshsnap.reference,{
                      'likes':freshsnap['likes']+1,
                      'dislike':freshsnap['dislike']-1,
                    });
                 });
               }),
               Text(document['likes'].toString(),
            style: TextStyle(
              fontSize: 15,
            ),),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
        
               IconButton(icon: Icon(Icons.thumb_down), onPressed:(){
                 Firestore.instance.runTransaction((transaction) async{
                    DocumentSnapshot freshsnap =await transaction.get(document.reference);
                    await transaction.update(freshsnap.reference,{
                      'likes':freshsnap['likes']-1,
                      'dislike':freshsnap['dislike']+1,

                    });
                 });
               }),
               Text(document['dislike'].toString(),
            style: TextStyle(
              fontSize: 15,
            ),),
          ],
        ),
             ],)
           ),
         // )
         // ),

             ],));
         }
        /*  */
         
         /**/

}
 /* @override
void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId:YoutubePlayer.convertUrlToId(videoURL),
      flags: const YoutubePlayerFlags(
        mute: true,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
}*/

  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.red[200],
      /*drawer:Drawer(
          child: ListView(
            children: <Widget>[
          
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.redAccent,Colors.blueAccent]),
              ),
              child:Text('Settings',
              style:TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              )
               ) ,
            ),
              
             FlatButton.icon(
              icon: Icon(Icons.stars),
              label: Text('Give it'),
              onPressed:()
              {
                return Add();
              },
            )
            ],
          ),

        ),*/
      
     appBar:AppBar(
backgroundColor: Colors.black,
title:Image.asset('assets/images/youtube.png',
fit: BoxFit.cover,
width:100),
actions: <Widget>[
  FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign-Out'),
              textColor: Colors.white,
              onPressed: () async {
                await _auth.signout();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.play_circle_filled),
              label: Text('play'),
              textColor: Colors.white,
              onPressed: ()  {
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Play())
                 );
              },
            ),
],
     ),
     // bottomNavigationBar: btmbar,
     // backgroundColor: Colors.white,
      /*body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            videos(vpic[0],vtitle[0],vtime[0]),
                  videos(vpic[1],vtitle[1],vtime[1]),
                videos(vpic[2],vtitle[2],vtime[2]),
                videos(vpic[0],vtitle[0],vtime[0]),
                  videos(vpic[1],vtitle[1],vtime[1]),

            
          ],
        ),
      )*/
      body: StreamBuilder(
        stream: Firestore.instance.collection('Yvideos').snapshots(),
      builder:(context, snapshot)
      {
        if(!snapshot.hasData)
        return const Text('Loading...!');
      return ListView.builder(
        itemCount: snapshot.data.documents.length,
        itemBuilder:(context,index)=> _buildListItem(context, snapshot.data.documents[index]),
        
      );
      }
      

      ),
     
    );
  }
  
}