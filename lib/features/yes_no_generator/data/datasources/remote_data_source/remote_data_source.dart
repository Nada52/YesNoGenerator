import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:yes_no_generator/core/api/api.dart';
import 'package:yes_no_generator/features/yes_no_generator/data/models/yes_no_model.dart';

class RemoteDataSource {
  Dio dio = Dio();
  Future<YesNoModel> generateYesNo() async {
    final response = await dio.get(Api.baseUrl);
    if (kDebugMode) {
      print(response);
    }

    return YesNoModel.fromJson(response.data);
  }
}
