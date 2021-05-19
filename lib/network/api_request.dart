import 'dart:convert';
import 'package:conversor_moedas/screens/home.dart';
import 'package:http/http.dart' as http;

Future<Map> getData() async {
  http.Response response = await http.get(Uri.parse(request));
  return jsonDecode(response.body);
}