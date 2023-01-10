import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:integraphics/main.dart';

Future<dynamic> AllChartdataAPi(BuildContext context, input) async {
  var DropdownApidata;

  await Future.delayed(Duration(seconds: 1));
  try {
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({"dashbordname": "$input"});
    var response = await post(
      Uri.parse('http://192.169.1.211:8080/smartBi/smartIntBi/getChartCards'),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      DropdownApidata = response.body;
      dataa = jsonDecode(response.body);
    } else {
      print(response.reasonPhrase);
    }
    return dataa;
  } on SocketException {}
}
