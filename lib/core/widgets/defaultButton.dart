import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({super.key, required this.text, required this.onPressed});
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      textColor: Colors.white,
      height: 50,
      color: Colors.deepPurple[400],
      onPressed: () {
        onPressed();
      },
      child: Text(text.toUpperCase()),
    );
  }
}
