import 'package:flutter/cupertino.dart';

class DetailItem extends StatelessWidget {
  final String itemTitle;
  final String itemValue;

  const DetailItem({Key? key, required this.itemTitle, required this.itemValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            itemTitle,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            itemValue,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
