import 'package:flutter/material.dart';

class QuotesTile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red.shade100,
      borderOnForeground: true,
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      elevation: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Quotes", style: TextStyle(color: Colors.grey,fontSize: 20),),
          Text("Author", style: TextStyle(color: Colors.grey, fontSize: 15),)

        ]
      ),
    );
  }
}
