import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class QuotePage extends StatelessWidget {
  final String text;
  final String author;
  final Color colour;
  QuotePage(this.text, this.author, this.colour);




  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Your Quote", style : TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600)),
        actions: [
          GestureDetector(
            onTap: (){

            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.save, size: 25,),
            ),
          ),
          Padding(padding: const EdgeInsets.all(10),
          child: Icon(Icons.more_vert_sharp, size: 25,),),
        ],
        //leading: Icon(Icons.ios_share),
      ),
      body: Card(
        color: colour ,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(this.text, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),),
                ),
                Center(
                  child: Text(this.author == null ?"Random"
                      : " - " +this.author, style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic ),),
                )
              ],
            ),
          ),
        ),

      ),
    );
  }
}
