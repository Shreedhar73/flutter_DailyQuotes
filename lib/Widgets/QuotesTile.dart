import 'package:flutter/material.dart';

class QuotesTile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Card(


        color: Colors.white,
        borderOnForeground: true,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Quotes", style: TextStyle(color: Colors.grey,fontSize: 20),),
              Text("Author", style: TextStyle(color: Colors.grey, fontSize: 15),)

            ]
          ),
        ),
      );

  }
}
