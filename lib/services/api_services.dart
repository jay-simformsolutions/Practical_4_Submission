import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:splitwise/model/group_expense_model.dart';
import 'package:splitwise/model/group_info_model.dart';
import 'package:splitwise/utils/common_strings.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: CommonStrings.baseUrl)

/// Responsible for Handling all the Network call
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('groups')
  Future<List<GroupInfoModel>> getGroupInfo();

  @POST('groups')
  Future<GroupInfoModel> addNewGroup(@Body() GroupInfoModel group);

  @DELETE('groups/{id}')
  Future<void> deleteGroup(@Path('id') String id);

  @GET('group_expense')
  Future<List<GroupExpenseModel>> getGroupExpense();
}
