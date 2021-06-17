import 'package:daily_quotes/Widgets/QuotesTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.blue.shade100,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Welcome to Daily Quotes", style: TextStyle(color: Colors.black87, fontSize: 25),),
                ),

                Container(
                  child: Obx(() => ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index){
                        return QuotesTile();
                      })),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
