import '../../models/user.dart';
import 'package:flutter/material.dart';

import 'detail_item.dart';

class UserDetailPage extends StatelessWidget {
  final User user;

  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text(user.username),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(
                context); // This will navigate back to the previous page
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // Aligns children to the start (top)
          crossAxisAlignment: CrossAxisAlignment.start,
          // Aligns children to the left
          children: [
            DetailItem(itemTitle: 'Name', itemValue: user.name),
            DetailItem(itemTitle: 'Email', itemValue: user.email),
            DetailItem(itemTitle: 'Phone', itemValue: user.phoneNumber),
            DetailItem(itemTitle: 'Website', itemValue: user.website),
            DetailItem(itemTitle: 'Company', itemValue: user.company.name),
            DetailItem(
                itemTitle: 'Address', itemValue: user.address.toString()),
          ],
        ),
      ),
    );
  }
}
