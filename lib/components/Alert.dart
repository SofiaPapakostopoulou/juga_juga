import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  Alert({required this.text});

  final String text;


  void ShowAlert(String text){
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(text,
            style:
            TextStyle(fontFamily: 'Fredericka the Great', fontSize: 20.0)),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              textStyle: const TextStyle(
                  fontFamily: 'Fredericka the Great', fontSize: 20),
              backgroundColor: Colors.deepPurple[150],
            ),
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
        elevation: 24.0,
        backgroundColor: Colors.deepPurple[400],
      ),
    );
  }
}