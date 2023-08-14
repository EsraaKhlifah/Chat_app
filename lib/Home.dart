import 'package:firebase1/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase1/register_screen.dart';
import 'componants.dart';

class HomePage extends StatefulWidget {
  static const String Screenrote = 'Homepage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [

                CircleAvatar (
                  radius: 105,
                  backgroundColor: Colors.yellow[900],
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage('https://1.bp.blogspot.com/-NtBcY8kmxSQ/YCjz2drXI3I/AAAAAAAAKDA/9eU8PK_aN3oyEtPCopSVBEO6mAVJq3O6gCLcBGAsYHQ/s847/%25D8%25B5%25D9%2588%25D8%25B1-%25D9%2588%25D8%25B1%25D8%25AF-%25D8%25B7%25D8%25A8%25D9%258A%25D8%25B9%25D9%258A-%25D9%2588%25D8%25B5%25D9%2586%25D8%25A7%25D8%25B9%25D9%258A-10.webp'),
                  ),
                ),


                Text(
                  'message me',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff2e3B6b)),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            mybutton(
                color: Colors.yellow[900]!, title: 'Sign In',
                onprssed: ()
                {Navigator.pushNamed(context, LoginScreen.Screenrote);}),
            mybutton(
                color: Colors.blue[800]!, title: 'register', onprssed: ()
            {Navigator.pushNamed(context, regestration.Screenrote);})
          ],
        ),
      ),
    );
  }
}
