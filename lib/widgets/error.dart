import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetryPressed;

  const Error(
      {Key? key, required this.errorMessage, required this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: onRetryPressed,
            child: const Text('Retry', style: TextStyle(color: Colors.black)),
          )
        ],
      ),
    );
  }
}
