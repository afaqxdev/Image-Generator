import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as https;
import 'package:image_generator/api_class/enum_class.dart';

class ApiClass {
  static Future<Uint8List?> generatingImage(String prompts) async {
    print(prompts);
    String key = "Bearer  vk-BKWmnRDMABwfhAjiV3y8tfxJBLBDCxLnkPIeby2ex2JrRf";
   try {
      String url = 'https://api.vyro.ai/v1/imagine/api/generations';
      Map<String, String> headers = {
        'Authorization': key
      };
      ApiResponse.loading;

      // Create a new multipart request
      var request = https.MultipartRequest('POST', Uri.parse(url));

      // Add headers to the request
      request.headers.addAll(headers);

      // Add fields to the multipart request
      request.fields['prompt'] = prompts;
      request.fields['style_id'] = '122';
      request.fields['aspect_ratio'] = '1:1';
      request.fields['cfg'] = '5';
      request.fields['seed'] = '1';
      request.fields['high_res_results'] = '1';

      // Send the request
      var streamedResponse = await request.send();

      // Get the response
      var response = await https.Response.fromStream(streamedResponse);
      print(response.statusCode);
      if (response.statusCode == 200) {
        Uint8List uint8List = Uint8List.fromList(response.bodyBytes);
        return uint8List;
      } else {
        return null;
      }
    } on SocketException {
      throw Exception("Error in Socket");
    } on TimeoutException {
      throw Exception("Time out Exception");
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
