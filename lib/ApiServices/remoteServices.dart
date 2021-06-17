import 'package:daily_quotes/Models/QuotesModel.dart';
import 'package:http/http.dart' as http;

class RemoteServices{
  static var client = http.Client();
  final Quotes quote;
  RemoteServices(this.quote);

  static Future <List<Quotes>> fetchQuotes() async{
    var response = await client.get("https://type.fit/api/quotes");
    if (response.statusCode == 200){
      var jsonString = response.body;
      return quotesFromJson(jsonString);
    }
    else{
      return null;
    }
  }




}