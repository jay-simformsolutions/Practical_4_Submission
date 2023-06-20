import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:splitwise/model/group_info.dart';
import 'package:splitwise/services/status_code.dart';
import 'package:splitwise/utils/common_strings.dart';

import '../generics/response_or_error.dart';
import 'api_services.dart';
import 'dio.dart';

class Repository {
  Repository._internal();

  static final Repository instance = Repository._internal();

  final client = RestClient(SingletonDio.instance.dio);

  Future<ResponseOrError<List<GroupInfoModel>>> getMovieData() async {
    return loadData(client.getGroupInfo());
  }

  Future<void> addNewGroup(GroupInfoModel groupInfoModel) async {
    try {
      await client.addNewGroup(groupInfoModel);
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
    }
  }
}

// Future<bool> checkConnectivity() async {
//   final internetResponse = Connectivity().onConnectivityChanged;
//
//   if (await internetResponse.isEmpty) {
//     return false;
//   } else {
//     return true;
//   }
// }

final client = RestClient(SingletonDio.instance.dio);

Future<ResponseOrError<T>> loadData<T>(Future<T> function) async {
  try {
    final response = await function;
    return ResponseOrError.success(response: response);
  } catch (e, s) {
    debugPrintStack(stackTrace: s);
    return catchError(e, s);
  }
}

ResponseOrError<T> catchError<T>(Object e, StackTrace s) {
  if (e is DioException) {
    if (e.error is SocketException) {
      return ResponseOrError.failure(errorInfo: CommonStrings.noInternet);
    }
    return ResponseOrError.failure(
      errorInfo: errorOnResponseHandler(e.response?.statusCode),
    );
  } else {
    return ResponseOrError.failure(errorInfo: CommonStrings.someThingWrong);
  }
}

String errorOnResponseHandler(int? statusCode) {
  if (statusCode == StatusCode.unauthorized) {
    return CommonStrings.error401;
  } else if (statusCode == StatusCode.unauthorized) {
    return CommonStrings.error402;
  } else if (statusCode == StatusCode.notFound) {
    return CommonStrings.error404;
  } else {
    return CommonStrings.someThingWrong;
  }
}
