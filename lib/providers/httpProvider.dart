import 'dart:convert';
import 'package:http/http.dart' show Client;


// Utils
import 'package:users/utils/config.dart';


class HttpProvider {

  Client client = Client();
  Config config = Config(); 
  String baseUrl = '';
  
  HttpProvider() {
    baseUrl =  config.prod ? config.urlProd : config.urlDev;
  }

  Future httpGet(String url) {
    return client.get(baseUrl + url);
  }

  Future httpPost(String url, Map body) {
    return client.post(baseUrl + url, headers:{"content-type": "application/json; charset=UTF-8", "Accept": "application/json" }, body: json.encode(body));
  }

}