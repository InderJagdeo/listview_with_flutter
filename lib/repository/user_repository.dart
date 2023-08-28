import 'package:dio/dio.dart';
import 'package:listview_with_flutter/networking/api_provider.dart';
import 'package:listview_with_flutter/networking/end_point.dart';

import '../models/user.dart';
import '../networking/methods.dart';

class UserRepository {
  final ApiProvider _provider = ApiProvider();

  Future<List<User>> requestListOfUsers() async {
    try {
      Response response = await _provider.request(path: EndPoints.users, method: Method.get.rawValue);
      final List result = response.data;
      return result.map((e) => User.fromJson(e)).toList();
    } catch (error) {
      throw Exception(error);
    }
  }
}
