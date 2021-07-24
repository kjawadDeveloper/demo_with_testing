import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final String message;
  const ErrorWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Icon(Icons.error), Text(message)],
    );
  }
}
