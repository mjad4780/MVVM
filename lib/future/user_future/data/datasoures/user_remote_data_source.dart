import 'package:untitled/core/databases/api/api_consumer.dart';
import 'package:untitled/core/databases/api/end_points.dart';
import 'package:untitled/core/params/params.dart';
import 'package:untitled/future/user_future/data/models/user_model.dart';

class UserRemoteDataSource {
  final ApiConsumer api;

  UserRemoteDataSource({required this.api});
  Future<UserModel> getUser(UserParams params) async {
    final response = await api.get("${EndPoints.user}/${params.id}");
    return UserModel.fromJson(response);
  }
}
