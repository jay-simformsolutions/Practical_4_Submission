import 'package:flutter/material.dart';

class NetworkErrorWidget extends StatelessWidget {
  const NetworkErrorWidget({
    this.function,
    this.text,
    super.key,
  });

  final VoidCallback? function;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            text!,
            style: TextStyle(fontSize: 25),
          ),
          ElevatedButton(
            onPressed: function,
            child: Text('Re-try'),
          ),
        ],
      ),
    );
  }
}
