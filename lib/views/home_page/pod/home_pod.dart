import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_code/constants/connection.dart';
import 'package:project_code/views/home_page/dto/home_dto.dart';

class HomePageProvider extends ChangeNotifier {
//  ---------------------------Api Callinhg Method Function---------------------------

  bool _error = false;
  HomePageResponse? homePageResponse;

  bool get error => _error;
  HomePageResponse? get homePageResponseModelData => homePageResponse;

  bool get ifLoading => homePageResponse == null && error == false;

  List<Data> homedata = [];
  Future<void> sampleApi() async {
    if (!await Connection.isConnected()) {
      return;
    }

    String uri =
        "http://170.187.237.20:5002/api/auth/getPoolController?matchId=1234";
    Dio dio = Dio();
    Response response = await dio.get(uri,
        options: Options(contentType: Headers.formUrlEncodedContentType));
    if (response.statusCode == 200) {
      try {
        if (response.statusCode == HttpStatus.ok) {
          homePageResponse = HomePageResponse.fromJson(response.data);
          if (homePageResponse != null) {
            homedata = homePageResponse!.data;
          }
        }
      } on DioException catch (e) {
        _error = true;
        log("Samople init Api  is Fail $e");
      }
    } else {
      log('ERror');
    }
    notifyListeners();
  }
}
