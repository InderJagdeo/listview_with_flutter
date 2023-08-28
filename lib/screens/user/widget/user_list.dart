import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/user.dart';
import '../../user_detail/user_detail_page.dart';

class UserList extends StatelessWidget {
  final List<User> list;

  const UserList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 8.0),
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 6.0,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetailPage(user: list[index]),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey[300]!,
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, top: 12, bottom: 12, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          list[index].username,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20, // Set your desired icon size
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        },
        itemCount: list.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
      ),
    );
  }
}
