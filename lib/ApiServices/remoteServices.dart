import 'dart:convert';

import 'package:daily_quotes/Models/QuotesModel.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class RemoteServices {
  Box box;

  Future openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('data');
    return;
  }

  static var client = http.Client();
  //

  Future<List<Quotes>> fetchQuotes() async {
    await openBox();
    try {
      var response = await client.get(Uri.parse("https://type.fit/api/quotes"));

      var _jsonDecode = response.body;

      await box.add(_jsonDecode);

      return quotesFromJson(_jsonDecode);
    } catch (SocketException) {
      var data = box.get("quotes");

      return quotesFromJson(data);
    }
  }
}
