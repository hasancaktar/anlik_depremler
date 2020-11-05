import 'package:http/http.dart' as http;
import 'dart:convert';

import 'depremJson.dart';

class Service {
  Future<DepremlerModel> fetchData() async {
    var response = await http.get("https://api.orhanaydogdu.com.tr/deprem/live.php?limit=100");
    if (response.statusCode == 200) {
      final _jsonResponse = DepremlerModel.fromJson(jsonDecode(response.body));
      return _jsonResponse;
    } else {
      throw Exception("istek durumu başarısız oldu${response.statusCode}");
    }
  }
}
