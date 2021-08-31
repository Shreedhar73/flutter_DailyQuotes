import 'dart:math';

import 'package:daily_quotes/ApiServices/remoteServices.dart';
import 'package:daily_quotes/Pages/QuotePage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RemoteServices rm = RemoteServices();

  @override
  void initState() {
    super.initState();

    rm.fetchQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.transparent,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Welcome to Daily Quotes",
                    style: TextStyle(color: Colors.black87, fontSize: 25),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: FutureBuilder(
                      future: rm.fetchQuotes(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final quotes = snapshot.data..shuffle();
                          List colors = [
                            Colors.red.shade100,
                            Colors.greenAccent.shade100,
                            Colors.blue.shade100,
                            Colors.lime.shade100,
                            Colors.amber.shade100,
                            Colors.purple.shade200,
                            Colors.lightGreen,
                            Colors.white12,
                            Colors.indigoAccent,
                            Colors.black38,
                          ];
                          Random rng = new Random();
                          var l = new List.generate(
                              quotes.length, (_) => rng.nextInt(4));
                          l.shuffle();

                          return RefreshIndicator(
                            child: ListView.builder(
                                itemCount: quotes.length,
                                itemBuilder: (context, index) {
                                  final quote = quotes[index];
                                  print(quotes.length);
                                  return InkWell(
                                    onTap: () {
                                      Get.to(() => QuotePage(quote.text,
                                          quote.author, colors[l[index]]));
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 20),
                                      elevation: 25,
                                      color: colors[l[index]],
                                      child: Container(
                                        padding: const EdgeInsets.all(25.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              quote.text == null
                                                  ? "RANDOM QUOTES"
                                                  : quote.text,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              quote.author == null
                                                  ? "Random"
                                                  : "- " + quote.author,
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                            onRefresh: () {
                              return Future.delayed(Duration(seconds: 1), () {
                                setState(() {
                                  rm.fetchQuotes();
                                });
                              });
                            },
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
