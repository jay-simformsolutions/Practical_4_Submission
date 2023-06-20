import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:splitwise/model/group_expense_model.dart';
import 'package:splitwise/model/group_info_model.dart';
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

  /// Get Group Expense Data
  Future<ResponseOrError<List<GroupExpenseModel>>> getGroupExpenseData() async {
    return loadData(client.getGroupExpense());
  }

  Future<ResponseOrError<void>> deleteGroup(String id) async {
    return loadData(client.deleteGroup(id));
  }

  /// Post Data of New Group
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

Future<bool> checkInternetConnectivity() async {
  try {
    var internetResponse = await InternetAddress.lookup('www.google.com');
    if (internetResponse.isNotEmpty &&
        internetResponse[0].rawAddress.isNotEmpty) {
      debugPrint(internetResponse[0].rawAddress.toString());
      return true;
    } else {
      internetResponse = [];
    }
  } catch (e) {
    if (e is SocketException) {
      debugPrint('No Internet Connectivity');
    }
  }
  return false;
}

final client = RestClient(SingletonDio.instance.dio);

Future<ResponseOrError<T>> loadData<T>(Future<T> function) async {
  if (await checkInternetConnectivity()) {
    try {
      final response = await function;
      return ResponseOrError.success(response: response);
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      debugPrint('Exception is $e');
      return catchError(e, s);
    }
  } else {
    return ResponseOrError.failure(errorInfo: CommonStrings.noInternet);
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
