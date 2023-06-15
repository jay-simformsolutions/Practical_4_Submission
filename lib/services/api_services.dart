import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:splitwise/model/group_info.dart';
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
}
