import 'package:flutter/material.dart';

class AAlert extends StatelessWidget {
  AAlert({required this.text});

  final text;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(text,
            style:
            TextStyle(fontFamily: 'Source Code Pro', fontSize: 20.0)),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              textStyle: const TextStyle(
                  fontFamily: 'Source Code Pro', fontSize: 20),
              backgroundColor: Colors.deepPurple[150],
            ),
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
        elevation: 24.0,
        backgroundColor: Colors.deepPurple[400],
      );
  }
}

