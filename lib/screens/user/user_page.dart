import 'package:flutter/material.dart';
import 'package:listview_with_flutter/blocs/user_bloc.dart';
import 'package:listview_with_flutter/screens/user/widget/user_list.dart';
import '../../blocs/response.dart';
import '../../models/user.dart';
import '../../widgets/loading.dart';
import '../../widgets/error.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends State<UserPage> {
  late UserBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = UserBloc();
    _bloc.fetchListOfUsers();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: const Text("Users"),
      ),
      body: RefreshIndicator(
        onRefresh: () => _bloc.fetchListOfUsers(),
        child: StreamBuilder<Response<List<User>>>(
            stream: _bloc.userListStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data?.status) {
                  case Status.loading:
                    return Loading(
                        loadingMessage: snapshot.data?.message ?? "");
                  case Status.completed:
                    return UserList(list: snapshot.data?.data ?? []);
                  case Status.error:
                    return Error(
                      errorMessage: snapshot.data?.message ?? "",
                      onRetryPressed: () => _bloc.fetchListOfUsers(),
                    );
                }
              }
              return Container();
            }),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}