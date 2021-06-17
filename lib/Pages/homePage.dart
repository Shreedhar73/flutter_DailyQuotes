import 'package:daily_quotes/ApiServices/remoteServices.dart';
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
                  height: MediaQuery.of(context).size.height*0.9,
                  child: FutureBuilder(

                         future: RemoteServices.fetchQuotes(),
                         builder: (context, snapshot){
                        if(snapshot.hasData){
                          final quotes = snapshot.data;
                          print(quotes.length);
                          return ListView.builder(
                              itemCount: quotes.length,
                              itemBuilder: (context,index){
                                final quote = quotes[index];
                            return Card(
                              elevation: 25,
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(quote.text == null ? "RANDOM QUOTES"
                                  : quote.text),
                                  Text(quote.author == null ?""
                                  :quote.author)
                                ],
                              ),
                            );

                          });

                        }
                        return Center(child: CircularProgressIndicator());}),
                )

                
                   // Container(
                   //   height: MediaQuery.of(context).size.height*0.9,
                   //   child: ListView.builder(
                   //      itemCount: 50,
                   //      scrollDirection: Axis.vertical,
                   //      itemBuilder: (context, index){
                   //        return QuotesTile();
                   //      }),
                   // )



              ],
            ),
          ),
        ),
      ),
    );
  }
}
