
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defultButtton({
  double Width=double.infinity,
  Color background=Colors.blue,
  double radius=0.0,
  required function ,
  required String text,
  bool isUpperCase=true,
})  => Container(
  width: Width=double.infinity,
  decoration: BoxDecoration(
      color: background= Colors.blue,

      borderRadius: BorderRadius.circular(radius)
  ),
  child: MaterialButton(onPressed: function,

    child: Text(
      isUpperCase? text.toUpperCase():text,
      style: TextStyle(
        color: Colors.white,
      ),
    ),

  ),
);
//import 'package:flutter/material.dart';

showLoading(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Please Wait"),
          content: Container(
              height: 50, child: Center(child: CircularProgressIndicator())),
        );
      });
}
class mybutton extends StatelessWidget {
  mybutton({ required this.color, required this.title, required this.onprssed});
  final Color color;
  final String title;
  final VoidCallback onprssed;

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Material(
          elevation: 5,
          color: color,
          borderRadius: BorderRadius.circular(10),
          child:
          MaterialButton(onPressed:onprssed ,
            minWidth: 200,

            height: 40,
            child: Text(title,style: TextStyle(color: Colors.white),),
          ),
        ),
      );
  }
}
