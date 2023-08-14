import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


import 'chats.dart';
import 'componants.dart';

class LoginScreen extends StatefulWidget {
  static const String Screenrote = 'LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  String? email;
  late String password;
 bool spanner=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(

          inAsyncCall: spanner,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    CircleAvatar (
                      radius: 105,
                      backgroundColor: Colors.yellow[900],
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage('https://1.bp.blogspot.com/-NtBcY8kmxSQ/YCjz2drXI3I/AAAAAAAAKDA/9eU8PK_aN3oyEtPCopSVBEO6mAVJq3O6gCLcBGAsYHQ/s847/%25D8%25B5%25D9%2588%25D8%25B1-%25D9%2588%25D8%25B1%25D8%25AF-%25D8%25B7%25D8%25A8%25D9%258A%25D8%25B9%25D9%258A-%25D9%2588%25D8%25B5%25D9%2586%25D8%25A7%25D8%25B9%25D9%258A-10.webp'),
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    mybutton(
                        color: Colors.yellow[900]!,
                        title: 'sign in',
                        onprssed: () async {
                          setState((){
                            spanner=true;
                          });
                          try{
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email!, password: password);
                          if(user!=null){
                            Navigator.pushNamed(context, ChatsScreen.Screenrote);
                            setState((){
                              spanner=false;
                            });}
                          }catch(e){print(e);}
                        })
                  ])),
        ));
  }
}
