import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
final _firstore = FirebaseFirestore.instance;

 User? signinuser; //هيديني الايميل

class ChatsScreen extends StatefulWidget {
  static const String Screenrote = 'ChatsScreen';

  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final messagecontroler=TextEditingController();
  final _auth = FirebaseAuth.instance;
  // late User signinuser; //هيديني الايميل

  String? messagetext; //هيديني الماسدج

  @override
  void initState() {
    super.initState();
    getcurrent();
  }

  void getcurrent() {
   // User ?signinuser; //هيديني الايميل

    final user = _auth.currentUser;
    try {
      if (user != null) {
        signinuser = user;
        print(signinuser?.email);
      }
    } catch (e) {
      print(e);
    }
  }

  // void getMessage() async {
  //   final messages = await _firstore.collection('messages').get();
  //   for (var message in messages.docs) {
  //     print(message.data());
  //   }
  // }
  void messagesStreem()async{
   await for(var snapshot in _firstore.collection('messages').snapshots()){
 for(var message in snapshot.docs){
      print(message.data());

 }
   }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[900],
        title: Row(

          children: [


            CircleAvatar (
              radius: 22,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('https://1.bp.blogspot.com/-NtBcY8kmxSQ/YCjz2drXI3I/AAAAAAAAKDA/9eU8PK_aN3oyEtPCopSVBEO6mAVJq3O6gCLcBGAsYHQ/s847/%25D8%25B5%25D9%2588%25D8%25B1-%25D9%2588%25D8%25B1%25D8%25AF-%25D8%25B7%25D8%25A8%25D9%258A%25D8%25B9%25D9%258A-%25D9%2588%25D8%25B5%25D9%2586%25D8%25A7%25D8%25B9%25D9%258A-10.webp'),
              ),
            ),
            SizedBox(width: 5,),


            Text('message me')],
        ),
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              },
              icon: Icon(Icons.close))
        ],
      ),
      body: SafeArea(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

             const Messagestreembuilder(),
            Container(
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.orange, width: 2))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: TextField(
                        controller: messagecontroler,

                    onChanged: (value) {
                      messagetext = value;
                    },
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        hintText: 'Write your message here...',
                        border: InputBorder.none),
                  )),
                  TextButton(


                      onPressed: () {
                        messagecontroler.clear();
                        _firstore.collection('messages').add(
                            {'text': messagetext,
                              'sender': signinuser?.email,
                              'time':FieldValue.serverTimestamp(),

                            }

                        );
                      },
                      child: Text(
                        'send',
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
class Messagestreembuilder extends StatelessWidget {
  const Messagestreembuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream:_firstore.collection('messages').orderBy('time').snapshots() ,
      builder:(context,snapshot){
        List<Messageline>messageWidgets=[];
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
            ),
          );
        }
        final messages =snapshot.data!.docs.reversed;
        for(var message in messages){
          final messagetext =message.get('text');
          final messagesender =message.get('sender');
          final currentuser= signinuser!.email;
          final messsagewidget=Messageline(sender:messagesender ,text: messagetext,
            isMe:currentuser==messagesender
            );
          messageWidgets.add(messsagewidget);

        }
        return Expanded(
          child: ListView(
            reverse: true,

            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),

              children: messageWidgets,
          ),
        );
      }, );
  }
}

class Messageline extends StatelessWidget {
  const Messageline({Key? key,  this.text,  this.sender,
    required this.isMe
  }) : super(key: key);
  final String ? text;
  final String ? sender;
 final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:isMe? CrossAxisAlignment.end:CrossAxisAlignment.start
          ,

        children: [
          Text('$sender',style: TextStyle(fontSize:12 ,color: Colors.yellow[900]),),
          Material(
            elevation: 5,
            borderRadius:isMe? BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)

            ):BorderRadius.only(
          topRight: Radius.circular(30),
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30)

    ),

            color:isMe? Colors.blue[800]:Colors.white,

              child:
          Padding(
            padding: const EdgeInsets.symmetric(vertical:10 ,horizontal: 20),
            child: Text('$text',style: TextStyle(fontSize:15 ,color:isMe? Colors.white:Colors.black45),
          )),
          )]
      ),
    );
  }
}
