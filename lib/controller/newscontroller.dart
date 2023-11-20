// import 'dart:convert';

// import 'package:sos/model/newsmodels.dart';
// import 'package:http/http.dart' as http;

// class Newscontroller {
//   Publicapiresponse? Newapi;

//   fetchdata() async {
//     final url = Uri.parse(
//         'https://newsapi.org/v2/everything?q=disaster&apiKey=c5e2f5e2b2c04bdfa3105fbc6e239c89');

//     var response = await http.get(url);
//     var decodedata = jsonDecode(response.body);

//     if (response.statusCode == 200) {
//       print('status code = ${response.statusCode}');
//       print(response.body);
//     } else {
//       print('Error loading data');
//     }
    
//     Newapi = Publicapiresponse.fromJson(decodedata);
//   }
// }
