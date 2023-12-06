import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sos/model/newsmodels.dart';

class NewsProvider extends ChangeNotifier {
  Publicapiresponse? Newapi;

  fetchdata() async {
    final url = Uri.parse(
        'https://newsapi.org/v2/everything?q=rain&apiKey=c5e2f5e2b2c04bdfa3105fbc6e239c89');

    var response = await http.get(url);
    var decodedata = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print('status code = ${response.statusCode}');
    } else {
      print('Error loading data');
    }
    Newapi = Publicapiresponse.fromJson(decodedata);

    notifyListeners();
  }
}
