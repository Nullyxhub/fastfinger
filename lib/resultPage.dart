import 'package:flutter/material.dart';

class resultPage extends StatefulWidget {
  int true_result;
  int false_result;
  int WPM;
  int key_stroke;


  resultPage({required this.true_result, required this.false_result, required this.WPM, required this.key_stroke});

  @override
  State<resultPage> createState() => _resultPageState();
}

class _resultPageState extends State<resultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Result Page"),
      ),
      body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Card(
               color: Colors.white,
               shape:const OutlineInputBorder(
                 borderRadius: BorderRadius.only(topLeft: Radius.elliptical(3, 10),bottomRight: Radius.elliptical(3, 10)),
                 borderSide: BorderSide(
                   color: Colors.blue,
                   width: 2,
                 ),
               ),
               child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                    Text("Results"),
                    Text("WPM : ${widget.WPM}",style: TextStyle(fontSize: 30),),
                    Text("True Result : ${widget.true_result}"),
                    Text("False Result : ${widget.false_result}"),
                    Text("True Result : ${widget.key_stroke}"),


                 ],
               ),
             )
           ],
         ),
      ),
    );
  }
}
