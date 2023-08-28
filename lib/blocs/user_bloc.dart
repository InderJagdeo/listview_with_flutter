import 'dart:async';
import 'package:listview_with_flutter/models/user.dart';
import 'package:listview_with_flutter/repository/user_repository.dart';

import 'response.dart';

class UserBloc {
  final userRepository = UserRepository();
  final streamController = StreamController<Response<List<User>>>();

  StreamSink<Response<List<User>>> get userListSink => streamController.sink;

  Stream<Response<List<User>>> get userListStream => streamController.stream;

  fetchListOfUsers() async {
    userListSink.add(Response.loading("Loading"));
    try {
      List<User> data = await userRepository.requestListOfUsers();
      userListSink.add(Response.completed(data));
    } catch (error) {
      userListSink.add(Response.error(error.toString()));
    }
  }

  void dispose() {
    streamController?.close();
  }
}
